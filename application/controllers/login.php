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
		$this->load->view('templates/header_login',$data);
		$this->load->view('login/index');
		$this->load->view('templates/footer_login');

	}

	public function proses_login()
	{
		$username = $this->input->post('user');
    	$password = $this->input->post('pwd');

		 // Query database untuk mengambil data pengguna berdasarkan username
		 $user = $this->db->get_where('login', ['username' => $username])->row_array();

		 if ($user) {
			 // Memeriksa apakah password cocok dengan hash yang disimpan dalam database
			 if (password_verify($password, $user['password'])) {
				$sessi = array(
					'id_user' => $user['id'],
					'username' => $user['firstname'],
					'lastname' => $user['lastname'],
					'level' => $user['role'],
					'login' => 'perpusweb'
				);
	
				$this->session->set_userdata($sessi);
				
				$respon = array('respon' => 'success');
				echo json_encode($respon);
			 } else {
				$respon = array('respon' => 'password salah');
				echo json_encode($respon);
			 }
		 } else {
			$respon = array('respon' => 'username tidak ditemukan');
			echo json_encode($respon);
		 }
    	
	}

	public function logout()
	{
		$this->session->sess_destroy();
		$respon = array('respon' => 'success');
		echo json_encode($respon);
	}
}
