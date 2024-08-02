<?php 
class Denda_model extends CI_Model {

    public function get_denda()
    {
        $this->db->where('id', 1);
        $query = $this->db->get('denda');
        return $query->row(); // Mengembalikan satu baris hasil query
    }
}
