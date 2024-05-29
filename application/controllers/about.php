<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class About extends CI_Controller {
	public function __construct() {
    parent::__construct();
    $this->load->helper('url');
    $this->load->helper('download');
	$this->load->library('pagination');
	$this->load->helper('cookie'); 
	$this->load->model('about_model'); 
  }
	public function index()
	{
		$data['title'] = 'About';
		$this->load->view('templates/header', $data);
		$this->load->view('about/index');
		$this->load->view('templates/footer');
	}

	public function detail_data()
  	{
		$where = array('id'=>'1');
		$data = $this->about_model->detail_data($where, 'about')->result();
		echo json_encode($data);
  	}

	public function ubah()
	{
		$data['title'] = 'About';
		$where = array('id'=>'1');
		$data['developer'] = $this->about_model->detail_data($where, 'about')->row();

		$this->load->view('templates/header', $data);
		$this->load->view('about/ubah_about');
		$this->load->view('templates/footer');
	}

	public function proses_ubah()
	{
		$config['upload_path']   = './assets/upload/pengguna/';
		$config['allowed_types'] = 'png|jpg|JPG|jpeg|JPEG|gif|GIF|tif|TIF||tiff|TIFF';
	
		$namaFile = $_FILES['photo']['name'];
		$error = $_FILES['photo']['error'];

		$this->load->library('upload', $config);
		
		$user = $this->input->post('nama_developer');
		$notelp = $this->input->post('no_hp');
		$email = $this->input->post('email');
		$keterangan = $this->input->post('keterangan');
		$flama = $this->input->post('fotoLama');
	
		if ($namaFile == '') {
		  	$ganti = $flama;
		}else{
			if (! $this->upload->do_upload('photo')) {
			  $error = $this->upload->display_errors();
		  	redirect('about/ubah/');
			}
			else{
			  $data = array('photo' => $this->upload->data());
			  $nama_file= $data['photo']['file_name'];
			  $ganti = str_replace(" ", "_", $nama_file);
			  if($flama !== 'user.png'){
				unlink('./assets/upload/pengguna/'.$flama.'');
			  }
			}
		}

		$data=array(
			'nama_developer'=>$user,
			'no_hp'=>$notelp,
			'email'=>$email,
			'keterangan'=>$keterangan,
			'foto'=>$ganti
				);

		$where = array('id'=>'1');
	  
		  $this->about_model->ubah_data($where, $data, 'about');
		  $this->session->set_flashdata('Pesan','
			<script>
			$(document).ready(function() {
			swal.fire({
				title: "Berhasil diubah!",
				icon: "success",
				confirmButtonColor: "#4e73df",
			});
			});
			</script>
			');

		  redirect('about');
	}
}
