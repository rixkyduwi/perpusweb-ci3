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
        $nestableData = $this->input->post('nestable');
        $newAmounts = $this->input->post('amount'); // Array of new amounts
        if ($nestableData){
        $nestableArray = json_decode($nestableData, true);
    
        $this->denda_model->update_all_denda_status(0);
    
        foreach ($nestableArray as $item) {
            $this->denda_model->update_denda_status($item['id'], $item['status']);
        }
        }
        if ($newAmounts) {
            foreach ($newAmounts as $amount) {
                $this->denda_model->tambah_denda(['amount' => $amount, 'status' => 0]);
            }
        }
    
        echo json_encode(['status' => 'success']);
    }
    
    

    public function tambah_proses() {
        $data = array(
            'amount' => $this->input->post('amount'),
            'status' => 0,
        );
        var_dump($data);
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
