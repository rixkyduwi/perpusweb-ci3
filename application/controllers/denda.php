<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Denda extends CI_Controller {

	public function __construct() {
    parent::__construct();
    $this->load->helper('url');
    $this->load->helper('download');
	$this->load->library('pagination');
	$this->load->helper('cookie');
    $this->load->model('denda_model');
  }

	public function index()
	{
		$data['title'] = "Set Denda";
		$data['denda'] = $this->denda_model->get_denda();
        $this->load->view('templates/header', $data);
        $this->load->view('denda/index');
        $this->load->view('templates/footer');
	}

    public function update()
    {
            $data = array(
                'amount' => $this->input->post('amount')
            );
            $this->denda_model->update_denda($data);
            redirect('denda/index');
    }
}