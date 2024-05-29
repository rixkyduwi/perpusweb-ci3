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
        // Validasi form
        $this->form_validation->set_rules('to_email', 'To', 'required|valid_email');
        $this->form_validation->set_rules('subject', 'Subject', 'required');
        $this->form_validation->set_rules('message', 'Message', 'required');

        if ($this->form_validation->run() == FALSE) {
            // Jika validasi gagal, kembali ke form
            $this->load->view('email_form');
        } else {
            // Mendapatkan input dari form
            $to_email = $this->input->post('to_email');
            $subject = $this->input->post('subject');
            $message = $this->input->post('message');

            // Konfigurasi email
            $config['protocol'] = 'smtp';
            $config['smtp_host'] = 'smtp.google.com'; // Ganti dengan host SMTP Anda
            $config['smtp_port'] = 587; // Ganti dengan port SMTP Anda
            $config['smtp_user'] = '.com'; // Ganti dengan email pengirim
            $config['smtp_pass'] = 'your_password'; // Ganti dengan password email pengirim
            $config['mailtype'] = 'html';
            $config['charset'] = 'iso-8859-1';
            $config['wordwrap'] = TRUE;
            $config['newline'] = "\r\n";

            $this->email->initialize($config);

            // Set pengirim, penerima, subject, dan isi email
            $this->email->from('your@example.com', 'Your Name'); // Ganti dengan nama pengirim
            $this->email->to($to_email);
            $this->email->subject($subject);
            $this->email->message($message);

            // Kirim email
            if ($this->email->send()) {
                echo 'Email berhasil dikirim.';
            } else {
                show_error($this->email->print_debugger());
            }
        }
    }
    
}