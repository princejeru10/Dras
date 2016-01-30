<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Tools extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        if (!$this->loggedIn) {
            $this->session->set_userdata('requested_page', $this->uri->uri_string());
            redirect('login');
        }
        $this->lang->load('tools', $this->Settings->language);
        $this->load->library('form_validation');
        $this->load->model('products_model');
        $this->digital_upload_path = 'files/';
        $this->upload_path = 'assets/uploads/';
        $this->thumbs_path = 'assets/uploads/thumbs/';
        $this->image_types = 'gif|jpg|jpeg|png|tif';
        $this->digital_file_types = 'zip|psd|ai|rar|pdf|doc|docx|xls|xlsx|ppt|pptx|gif|jpg|jpeg|png|tif';
        $this->allowed_file_size = '1024';
        $this->popup_attributes = array('width' => '900', 'height' => '600', 'window_name' => 'sma_popup', 'menubar' => 'yes', 'scrollbars' => 'yes', 'status' => 'no', 'resizable' => 'yes', 'screenx' => '0', 'screeny' => '0');
    }

    function index($warehouse_id = NULL)
    {
        $this->sma->checkPermissions();

        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        if ($this->Owner) {
            $this->data['warehouses'] = $this->site->getAllWarehouses();
            $this->data['warehouse_id'] = $warehouse_id;
            $this->data['warehouse'] = $warehouse_id ? $this->site->getWarehouseByID($warehouse_id) : NULL;
        } else {
            $this->data['warehouses'] = NULL;
            $this->data['warehouse_id'] = $this->session->userdata('warehouse_id');
            $this->data['warehouse'] = $this->session->userdata('warehouse_id') ? $this->site->getWarehouseByID($this->session->userdata('warehouse_id')) : NULL;
        }

        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => '#', 'page' => lang('products')));
        $meta = array('page_title' => lang('products'), 'bc' => $bc);
        $this->page_construct('tools/index', $meta, $this->data);
    }

    function add()
    {
        $this->sma->checkPermissions();
        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $this->data['id'] = '1';

        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => '#', 'page' => lang('products')));
        $meta = array('page_title' => lang('tools'), 'bc' => $bc);
        $this->page_construct('tools/add', $meta, $this->data);
    }

    function lend()
    {
        $this->sma->checkPermissions();
        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $this->data['id'] = '1';

        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => '#', 'page' => lang('products')));
        $meta = array('page_title' => lang('out_tools'), 'bc' => $bc);
        $this->page_construct('tools/lend', $meta, $this->data);
    }

    function return_tools()
    {
        $this->sma->checkPermissions();
        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $this->data['id'] = '1';

        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => '#', 'page' => lang('products')));
        $meta = array('page_title' => lang('return_tools'), 'bc' => $bc);
        $this->page_construct('tools/return_tools', $meta, $this->data);
    }

    function getTools($warehouse_id = NULL)
    {
        $this->sma->checkPermissions('index');


        $detail_link = anchor('tools/view/$1', '<i class="fa fa-file-text-o"></i> ' . lang('tool_details'));
        $delete_link = "<a href='#' class='tip po' title='<b>" . $this->lang->line("delete_tool") . "</b>' data-content=\"<p>"
            . lang('r_u_sure') . "</p><a class='btn btn-danger po-delete1' id='a__$1' href='" . site_url('tools/delete/$1') . "'>"
            . lang('i_m_sure') . "</a> <button class='btn po-close'>" . lang('no') . "</button>\"  rel='popover'><i class=\"fa fa-trash-o\"></i> "
            . lang('delete_product') . "</a>";

        $action = '<div class="text-center"><div class="btn-group text-left">'
            . '<button type="button" class="btn btn-default btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">'
            . lang('actions') . ' <span class="caret"></span></button>
		<ul class="dropdown-menu pull-right" role="menu">
			<li>' . $detail_link . '</li>'.
            '<li><a href="' . site_url('tools/edit/$1') . '"><i class="fa fa-edit"></i> ' . lang('edit_tool') . '</a></li>';

        $action .= '<li class="divider"></li>
				<li>' . $delete_link . '</li>
			</ul>
		</div></div>';

        $this->load->library('datatables');


//        $this->datatables
//            ->select($this->db->dbprefix('tools') . ".id as toolid, " . $this->db->dbprefix('tools') . ".image as image, " . $this->db->dbprefix('tools') . ".name as name, " . $this->db->dbprefix('tools') . ".description as description, " . $this->db->dbprefix('tools') . ".category_id as cname")
//            ->from('tools');

        $this->datatables
            ->select($this->db->dbprefix('tools') . ".id as toolid, " . $this->db->dbprefix('tools') . ".image as image, " . $this->db->dbprefix('tools') . ".name as name, " . $this->db->dbprefix('tools') . ".description as description, " . $this->db->dbprefix('tools_categories') . ".name as cname")
            ->from('tools')
            ->join('tools_categories', 'tools_categories.id=tools.id');


        $this->datatables->add_column("Actions", $action, "toolid, image, name");
        echo $this->datatables->generate();
    }

}