<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pengembalian extends CI_Controller {
	public function __construct() {
    parent::__construct();
    $this->load->helper('url');
    $this->load->helper('download');
	$this->load->library('pagination');
	$this->load->helper('cookie');
	$this->load->model('peminjaman_model');
	$this->load->model('pengembalian_model');
	// Load library email dan helper
	$this->load->library('email');
	$this->load->helper('form');
	$this->load->model('denda_model');
  }
	
	public function index()
	{
		$data['title'] = 'Pengembalian';
		$data['pengembalian'] = $this->pengembalian_model->dataJoin()->result();

		$this->load->view('templates/header', $data);
		$this->load->view('pengembalian/index');
		$this->load->view('templates/footer');
	}
	
	public function tambah()
	{
		$data['title'] = 'Pengembalian';
		$data['pinjam'] = $this->peminjaman_model->dataJoinStatus()->result();
		$data['tglnow'] = date('Y-m-d');
		$data['denda'] = $this->denda_model->get_denda();
		$this->load->view('templates/header', $data);
		$this->load->view('pengembalian/form_tambah');
		$this->load->view('templates/footer');
	}
	
	public function getPinjam()
	{
		$id = $this->input->post('id');
    	$data = $this->peminjaman_model->detail_data_join($id)->result();
    	echo json_encode($data);
	}

	public function getListBuku()
	{
		$id = $this->input->post('id');
    	$data = $this->peminjaman_model->detail_buku_join($id)->result();
    	echo json_encode($data);
	}
	
	public function getUser()
	{
		$id = $this->input->post('id');
    	$data = $this->peminjaman_model->detail_user_join($id)->result();
    	echo json_encode($data);
	}

	public function proses_hapus($id)
	{
		$where = array('id_kembali' => $id );
		$this->pengembalian_model->hapus_data($where, 'pengembalian');

		$this->session->set_flashdata('Pesan','
		<script>
		$(document).ready(function() {
			swal.fire({
				title: "Berhasil dihapus!",
				icon: "success",
				confirmButtonColor: "#4e73df",
			});
		});
		</script>
		');
		redirect('pengembalian');

	}

	public function proses_tambah()
	{
		$idpinjam = $this->input->post('pinjam');
		$lambat = $this->input->post('terlambat');
		$denda = $this->input->post('denda');
		$tglnow = $this->input->post('tglnow');

		$data = array(
			'id_pinjam' => $idpinjam,
			'terlambat' => $lambat,
			'denda' => $denda,
			'tgl_kembali' => $tglnow
		);

		$status = array(
			'status' => 'Kembali'
		);

		$where = array('id_pinjam'=>$idpinjam);

		$this->pengembalian_model->tambah_data($data, 'pengembalian');
		$this->peminjaman_model->ubah_data($where, $status, 'perpusweb_peminjaman');

		$this->session->set_flashdata('Pesan','
			<script>
			$(document).ready(function() {
			swal.fire({
				title: "Berhasil dikembalikan!",
				icon: "success",
				confirmButtonColor: "#4e73df",
			});
			});
			</script>
			');

		redirect('pengembalian');

	}
	public function send_email() {
        // Mendapatkan input dari form
        $to_email = $this->input->post('to_email');
        $subject = $this->input->post('subject');
        $message = $this->input->post('message');

        // Konfigurasi email
        $config['protocol'] = 'smtp';
        $config['smtp_host'] = 'smtp.gmail.com';
        $config['smtp_port'] = 587;
        $config['smtp_user'] = 'pustakagama72dtegal@gmail.com';
        $config['smtp_pass'] = 'ewwg gsdy gewp bskh';
        $config['mailtype'] = 'html';
        $config['charset'] = 'utf-8';
        $config['wordwrap'] = TRUE;
        $config['newline'] = "\r\n";
        $config['smtp_crypto'] = 'tls'; // Menggunakan TLS

        // Load library email dan inisialisasi konfigurasi
        $this->load->library('email', $config);
        $this->email->initialize($config);

        // Set pengirim, penerima, subject, dan isi email
        $this->email->from('pustakagama72dtegal@gmail.com', 'Admin Pustakagama');
        $this->email->to($to_email);
        $this->email->subject($subject);
        $this->email->message($message);

        // Kirim email
        if ($this->email->send()) {
            echo 'Email berhasil dikirim.';
        } else {
            // Menampilkan pesan error yang lebih detail
            echo 'Email gagal dikirim. Debugging message: ' . $this->email->print_debugger();
        }
        
    }	
    
}