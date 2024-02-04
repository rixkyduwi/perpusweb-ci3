<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

	public function __construct() {
    parent::__construct();
    $this->load->helper('url');
    $this->load->helper('download');
	$this->load->library('pagination');
	$this->load->helper('cookie');
	$this->load->model('login_model');

  }

	public function index()
	{
		
		$data['title'] = "Login";
		// $pswd = password_hash("123456", PASSWORD_DEFAULT); 
		// echo $pswd;
		$this->load->view('templates/header_login',$data);
		$this->load->view('login/index');
		$this->load->view('templates/footer_login');

	}

	public function proses_login()
	{
		$json_data = file_get_contents("php://input");
		$data = json_decode($json_data, true);
		header('Content-Type: application/json');
		$email = $data["email"];
		$password =  $data["password"];
		// Validasi input
		if (empty($email) || empty($password)) {
			$response = array('respon' => 'error', 'message' => 'email dan password harus diisi');
			echo json_encode($response);
		} else {
			// Query database untuk mengambil data pengguna berdasarkan email
			$user = $this->db->get_where('pengguna', ['email' => $email])->row_array();
		
			if ($user) {
				// Memeriksa apakah password cocok dengan hash yang disimpan dalam database
				if ($password === $user['pass']) {
					if ($user['level'] == 'siswa'){
						$member = $this->db->get_where('anggota', ['email' => $email])->row_array();
		
						$sessi = array(
							'id_user' => $user['id_user'],
							'id_member' => $member['id_anggota'],
							'nis' => $member['nis'],
							'nama' => $user['nama'],
							'email' => $user['email'],
							'level' => $user['level'],
							'login' => 'perpusweb'
						);
					}
					else{
					$sessi = array(
						'id_user' => $user['id_user'],
						'id_member' => "A0035",
						'nis' => "107450",
						'nama' => $user['nama'],
						'email' => $user['email'],
						'level' => $user['level'],
						'login' => 'perpusweb'
					);
					}
					
					$this->session->set_userdata($sessi);
		
					$response = array('respon' => 'success');
					echo json_encode($response);
				} else {
					$response = array('respon' => 'error', 'message' => 'Password salah');
					echo json_encode($response);
				}
			} else {
				$response = array('respon' => 'error', 'message' => 'email tidak ditemukan');
				echo json_encode($response);
			}
		}
		
    	
	}

	public function logout()
	{
		$this->session->sess_destroy();
		$respon = array('respon' => 'success');
		echo json_encode($respon);
	}
}
