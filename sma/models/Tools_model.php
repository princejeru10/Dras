<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Tools_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    public function getAllProducts()
    {
        $q = $this->db->get('products');
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }

            return $data;
        }
    }



}