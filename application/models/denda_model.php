<?php 
class Denda_model extends CI_Model {
    public function all_denda()
    {
        return $this->db->get('denda');// Mengembalikan satu baris hasil query
    }
    public function get_denda()
    {
        $this->db->where('id', 1);
        $query = $this->db->get('denda');
        return $query->row(); // Mengembalikan satu baris hasil query
    }
    public function update_denda($data)
    {
        $this->db->where('id', 1);
        return $this->db->update('denda', $data);
    }
    
}
