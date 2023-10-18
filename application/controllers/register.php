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
			$username = $this->input->post('email');
			$data = [];
			$where = [
				'nis' => $nis
			];
	
			if ($this->db->where($where)->update('member', ['email' => $username])) {
				// Sukses
			} else {
				echo "server error";
			}
	
			$newData = [
				'firstname' => $this->input->post('firstname'),
				'lastname' => $this->input->post('lastname'),
				'username' => $username,
				'role' => "siswa",
				'password' => password_hash($this->input->post('password'), PASSWORD_DEFAULT), // Hash password
			];
	
			$this->db->insert('login', $newData);
	
			$this->session->set_flashdata('success', 'Successful Registration');
			redirect('/login');
		}
	}
	
	public function findMember()
	{
		$data = [];
		$id = $this->input->post('id');
		$where = array(
			'nis' => $id
		);
		$member = $this->db->get_where('member', $where)->row_array(); // Mengambil data anggota berdasarkan nis
	
		if ($member) {
			echo $member['fullname'];
		} else {
			echo "tidak ditemukan";
		}
	}
	
}