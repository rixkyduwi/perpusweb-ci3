<?php 

class member_model extends ci_model{
  
  public function all_member()
	{
  return $query = $this->db->get('member');
  }
  public function where($table, $where)
  {
  return $query = $this->db->get_where($table, $where);
  }
  public function save($table, $data)
  {
  return $query = $this->db->insert($table, $data);
  }
}
