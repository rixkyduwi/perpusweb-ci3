<?php
class Denda_model extends CI_Model {

    public function all_denda() {
        $this->db->order_by('status', 'DESC');
        return $this->db->get('denda')->result();
    }

    public function get_denda() {
        $this->db->where('status', 1);
        $query = $this->db->get('denda');
        return $query->row();
    }

    public function update_denda_status($id, $status) {
        $this->db->where('id', $id);
        return $this->db->update('denda', ['status' => $status]);
    }

    public function update_all_denda_status($status) {
        return $this->db->update('denda', ['status' => $status]);
    }

    public function tambah_denda($data) {
        return $this->db->insert('denda', $data);
    }
}
