<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Denda extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->helper('url');
        $this->load->model('denda_model');
    }

    public function index() {
        $data['title'] = "Set Denda";
        $data['denda'] = $this->denda_model->all_denda();
        $this->load->view('templates/header', $data);
        $this->load->view('denda/index');
    }

    public function save() {
        $data = $this->input->post();
        $nestableData = json_decode($data['nestable'], true);
        $amount = $data['amount'];

        // Update all denda statuses to 0
        $this->denda_model->update_all_denda_status(0);

        // Update the status of the first item in the list to 1
        if (isset($nestableData[0]['id'])) {
            $this->denda_model->update_denda_status($nestableData[0]['id'], 1);
        }

        // Save new denda item
        if ($amount) {
            $this->denda_model->tambah_denda(['amount' => $amount, 'status' => 0]);
        }

        // Optionally redirect or set a success message
        $this->session->set_flashdata('Pesan', 'Perubahan disimpan');
        redirect('denda');
    }

    public function tambah_proses() {
        $data = array(
            'amount' => $this->input->post('amount'),
        );

        if ($this->denda_model->tambah_denda($data)) {
            $this->session->set_flashdata('success', 'Denda berhasil ditambahkan.');
        } else {
            $this->session->set_flashdata('error', 'Gagal menambahkan denda.');
        }
        redirect('denda');
    }

    public function update() {
        $data = array(
            'amount' => $this->input->post('amount')
        );
        $this->denda_model->update_denda($data);
        redirect('denda/index');
    }
}
