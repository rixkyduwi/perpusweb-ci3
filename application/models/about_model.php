<?php
class about_model extends ci_model{
    function data()
    {
        $query = $this->db->get('about');
        return $query;
    }
    public function detail_data($where, $table)
    {
       return $this->db->get_where($table,$where);
    }

    public function ubah_data($where, $data, $table)
    {
       $this->db->where($where);
       $this->db->update($table, $data);
    }

}