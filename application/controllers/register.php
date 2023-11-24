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
		$data = [];
		// Validasi input di sini
		$this->form_validation->set_rules('firstname', 'First Name', 'required|min_length[3]|max_length[20]');
		$this->form_validation->set_rules('lastname', 'Last Name', 'required|min_length[3]|max_length[20]');
		$this->form_validation->set_rules('email', 'Username', 'required|min_length[3]|max_length[100]|is_unique[login.username]');
		$this->form_validation->set_rules('password', 'Password', 'required|min_length[8]|max_length[255]');
		$this->form_validation->set_rules('password_confirm', 'Password Confirmation', 'matches[password]');
	
		if ($this->form_validation->run() == false) {
			$data['validation_errors'] = validation_errors();
		} else {
			$nis = $this->input->post('member_id');
			$email = $this->input->post('email');
			$data = [];
			$where = [
				'nis' => $nis
			];
	
			if ($this->db->where($where)->update('member', ['email' => $email])) {
				// Sukses
			} else {
				echo "server error";
			}
	
			// $newData = [
			// 	'firstname' => $this->input->post('firstname'),
			// 	'lastname' => $this->input->post('lastname'),
			// 	'username' => $username,
			// 	'role' => "siswa",
			// 	'password' => password_hash($this->input->post('password'), PASSWORD_DEFAULT), // Hash password
			// ];
			$kode = $this->user_model->buat_kode(); 
			$newData = [
				'id_user'=> $kode,
				'nama' => $this->input->post('firstname')." ".$this->input->post('lastname'),
				'email' => $email,
				'level' => "siswa",
				'pass' => password_hash($this->input->post('password'), PASSWORD_DEFAULT), // Hash password
				'foto' => 'man.png'
			];
			$this->db->insert('pengguna', $newData);
	
			$this->session->set_flashdata('success', 'Successful Registration');
			return redirect('login');
		}
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