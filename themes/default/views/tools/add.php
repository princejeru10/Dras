<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-plus"></i><?= lang('add_tool'); ?></h2>
    </div>
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">

                <p class="introtext"><?php echo lang('enter_info'); ?></p>

                <?php
                $attrib = array('data-toggle' => 'validator', 'role' => 'form');
                echo form_open_multipart("tools/add", $attrib)
                ?>

                <div class="col-md-5">
                    <div class="form-group all">
                        <?= lang("tool_name", "name") ?>
                        <?= form_input('name', (isset($_POST['name']) ? $_POST['name'] : ($tool ? $tool->name : '')), 'class="form-control" id="name" required="required"'); ?>
                    </div>


                    <div class="form-group all">
                        <?= lang("category", "category") ?>
                        <?php
                        $cat[''] = "";
                        foreach ($categories as $category) {
                            $cat[$category->id] = $category->name;
                        }
                        echo form_dropdown('category', $cat, (isset($_POST['category']) ? $_POST['category'] : ($product ? $product->category_id : '')), 'class="form-control select" id="category" placeholder="' . lang("select") . " " . lang("category") . '" required="required" style="width:100%"')
                        ?>
                    </div>

                    <div class="form-group all">
                        <?= lang("tool_image", "tool_image") ?>
                        <input id="tool_image" type="file" name="tool_image" data-show-upload="false"
                               data-show-preview="false" accept="image/*" class="form-control file">
                    </div>


                </div>

                <div class="col-md-12">

                    <div class="form-group all">
                        <?= lang("description", "description") ?>
                        <?= form_textarea('tool_description', (isset($_POST['tool_description']) ? $_POST['tool_description'] : ($tool ? $tool->tool_description : '')), 'class="form-control" id="description"'); ?>
                    </div>

                    <div class="form-group">
                        <?php echo form_submit('add_tool', $this->lang->line("add_tool"), 'class="btn btn-primary"'); ?>
                    </div>

                </div>
                <?= form_close(); ?>

            </div>

        </div>
    </div>
</div>