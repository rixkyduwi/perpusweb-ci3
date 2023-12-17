<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Register extends CI_Controller {

	public function __construct() {
    parent::__construct();
    $this->load->helper('url');
    $this->load->helper('download');
	$this->load->library('pagination');
	$this->load->helper('cookie');
	$this->load->model('member_model');
	$this->load->model('user_model');
    $this->load->library('form_validation');
  }

    public function index()
	{
		$data = [];
		
		$data['title'] = "Register";
		$anggota = $this->member_model->all_member();
		$data['anggota'] = $anggota;
		$this->load->view('templates/header_login', $data);
		$this->load->view('register/index', $data);
		$this->load->view('templates/footer_login');
	}
	public function proses_register()
	{
		
		// Validasi input di sini
		$this->form_validation->set_rules('firstname', 'First Name', 'required|min_length[3]|max_length[20]');
		$this->form_validation->set_rules('lastname', 'Last Name', 'required|min_length[3]|max_length[20]');
		$this->form_validation->set_rules('email', 'Email', 'required|min_length[3]|max_length[100]|is_unique[pengguna.email]');
		$this->form_validation->set_rules('password', 'Password', 'required|min_length[8]|max_length[255]');
		$this->form_validation->set_rules('password_confirm', 'Password Confirmation', 'matches[password]');
	
		if ($this->form_validation->run() == false) {
			$data['validation_errors'] = validation_errors();
			$this->session->set_flashdata('validation_errors', validation_errors());

			// Redirect ke halaman registrasi
			redirect('register');
		} else {
			$nis = $this->input->post('member_id');
			$email = $this->input->post('email');
			$data = [];
			$where = [
				'nis' => $nis
			];
	
			if ($this->db->where($where)->update('anggota', ['email' => $email])) {
				// Sukses
			} else {
				log_message('error', 'Server error: Unable to update member email.');
				show_error('Server error. Please try again later.', 500, 'Server Error');			
			}
	
			// $newData = [
			// 	'firstname' => $this->input->post('firstname'),
			// 	'lastname' => $this->input->post('lastname'),
			// 	'username' => $username,
			// 	'role' => "siswa",
			// 	'password' => password_hash($this->input->post('password'), PASSWORD_DEFAULT), // Hash password
			// ];
			$nama = $this->input->post('firstname')." ".$this->input->post('lastname');
			$kode = $this->user_model->buat_kode(); 
			$token = bin2hex(random_bytes(50)); // generate unique token
			echo $token;
			$newData = [
				'id_user'=> $kode,
				'nama' => $nama,
				'email' => $email,
				'level' => "siswa",
				'status' => "Tidak Aktif",
				'pass' => password_hash($this->input->post('password'), PASSWORD_DEFAULT), // Hash password
				'foto' => 'man.png',
				'token' => $token
			];
			$emailBody = "";
			$emailBody = $emailBody ."Hello  " . $nama . ",\n<br />";
			$emailBody = $emailBody .'Thanks so much for joining us. <br><br>To get started <a href="https://www.sitename.com/verification?email='.$email.'&token='.$token.'">Verify your account</a><br><br> OR copy and past the following code on your browser:<br>http://127.0.0.1/verification?email='.$email.'&token='.$token.' <br><br>to continue.<br><br>Thanks for signing up into the system. <br />';

			// Sending mail
			$to = "$email"; 
			$from = "pustakagamasmkn3tegal <noreply@pustakagamasmkn3tegal.my.id>"; 
			$subject = 'Verify Your Email Address'; 
			//$message = ""; 
			$headers = "From: $from\n"; 
			$headers .= "MIME-Version: 1.0\n"; 
			$headers .= "Content-type: text/html; charset=iso-8859-1\n"; 
			try {
				mail($to, $subject, $emailBody, $headers);
			} catch (Exception $e) {
				log_message('error', 'Email sending failed: ' . $e->getMessage());
				show_error('Email sending failed. Please contact support.', 500, 'Email Error');
			}
			$this->db->insert('pengguna', $newData);
	
			$this->session->set_flashdata('success', 'Successful Registration');
			return redirect('login');
		}
		return redirect('login');
	}
	
	public function findMember()
	{
		$data = [];
		$id = $this->input->post('id');
		$where = array(
			'nis' => $id
		);
		$member = $this->db->get_where('anggota', $where)->row_array(); // Mengambil data anggota berdasarkan nis
		$newData = [
			'fullname' => $member['nama_lengkap'],
			'kelas' => $member['kelas'],
			'jurusan' => $member['jurusan'],
		];
		if ($member) {
			echo json_encode($newData, true);; //ketika Anda ingin mengirim data dari server ke aplikasi klien atau sebaliknya, dan JSON sering digunakan karena kemudahan pembacaannya oleh berbagai bahasa pemrograman.
		} else {
			echo "tidak ditemukan";
		}
	}
	
}