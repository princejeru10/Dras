<script type="text/javascript">
var inclusive_tax_price_calculation = <?= $Settings->price_cal; ?>,
count = 1, an = 1, product_variant = 0, DT = <?= $Settings->default_tax_rate ?>, DC = '<?=$default_currency->code?>', shipping = 0,
product_tax = 0, invoice_tax = 0, total_discount = 0, total = 0,
tax_rates = <?php echo json_encode($tax_rates); ?>, poitems = {},
audio_success = new Audio('<?= $assets ?>sounds/sound2.mp3'),
audio_error = new Audio('<?= $assets ?>sounds/sound3.mp3');
$(document).ready(function () {
    <?php if ($inv) { ?>
        localStorage.setItem('podate', '<?= date($dateFormats['php_ldate'], strtotime($inv->date))?>');
         localStorage.setItem('supplier_po', '<?=$inv->supplier_po?>');
        localStorage.setItem('poref', '<?=$inv->reference_no?>');
        // localStorage.setItem('mrfno', '<?=$inv->mrf_no?>');
         localStorage.setItem('rr_no', '<?=$inv->rr_no?>');
        localStorage.setItem('poaction','receive');
        console.log(localStorage.getItem('poaction'));
        localStorage.setItem('powarehouse', '<?=$inv->warehouse_id?>');
        localStorage.setItem('postatus', '<?=$inv->status?>');
    if(localStorage.getItem('postatus')=="complete"){
        jQuery("input,select").prop({"disabled":"disabled"});
    }
        localStorage.setItem('rrnote', '<?= str_replace(array("\r", "\n"), "", $this->sma->decode_html($inv->note)); ?>');
        localStorage.setItem('podiscount', '<?=$inv->order_discount_id?>');
        localStorage.setItem('potax2', '<?=$inv->order_tax_id?>');
        localStorage.setItem('poshipping', '<?=$inv->shipping?>');
        if (parseFloat(localStorage.getItem('potax2')) >= 1 || localStorage.getItem('podiscount').length >= 1 || parseFloat(localStorage.getItem('poshipping')) >= 1) {
            localStorage.setItem('poextras', '1');
        }
        //localStorage.setItem('posupplier', '<?=$inv->supplier_id?>');
        localStorage.setItem('poitems', JSON.stringify(<?=$inv_items;?>));
        <?php } ?>

        <?php //if ($Owner || $Admin) { ?>
            $(document).on('change', '#podate', function (e) {
                localStorage.setItem('podate', $(this).val());
            });
            if (podate = localStorage.getItem('podate')) {
                $('#podate').val(podate);
            }
            <?php //} ?>
            ItemnTotals();
            $("#add_item").autocomplete({
                source: '<?= site_url('purchases/suggestions'); ?>',
                minLength: 1,
                autoFocus: false,
                delay: 200,
                response: function (event, ui) {
                    if ($(this).val().length >= 16 && ui.content[0].id == 0) {
                    //audio_error.play();
                    bootbox.alert('<?= lang('no_match_found') ?>', function () {
                        $('#add_item').focus();
                    });
                    $(this).val('');
                }
                else if (ui.content.length == 1 && ui.content[0].id != 0) {
                    ui.item = ui.content[0];
                    $(this).data('ui-autocomplete')._trigger('select', 'autocompleteselect', ui);
                    $(this).autocomplete('close');
                    $(this).removeClass('ui-autocomplete-loading');
                }
                else if (ui.content.length == 1 && ui.content[0].id == 0) {
                    //audio_error.play();
                    bootbox.alert('<?= lang('no_match_found') ?>', function () {
                        $('#add_item').focus();
                    });
                    $(this).val('');
                }
            },
            select: function (event, ui) {
                event.preventDefault();
                if (ui.item.id !== 0) {
                    var row = add_purchase_item(ui.item);
                    if (row)
                        $(this).val('');
                } else {
                    //audio_error.play();
                    bootbox.alert('<?= lang('no_match_found') ?>');
                }
            }
        });
$('#add_item').bind('keypress', function (e) {
    if (e.keyCode == 13) {
        e.preventDefault();
        $(this).autocomplete("search");
    }
});

$(document).on('click', '#addItemManually', function (e) {
    if (!$('#mcode').val()) {
        $('#mError').text('<?=lang('product_code_is_required')?>');
        $('#mError-con').show();
        return false;
    }
    if (!$('#mname').val()) {
        $('#mError').text('<?=lang('product_name_is_required')?>');
        $('#mError-con').show();
        return false;
    }
    if (!$('#mcategory').val()) {
        $('#mError').text('<?=lang('product_category_is_required')?>');
        $('#mError-con').show();
        return false;
    }
    if (!$('#munit').val()) {
        $('#mError').text('<?=lang('product_unit_is_required')?>');
        $('#mError-con').show();
        return false;
    }
    if (!$('#mcost').val()) {
        $('#mError').text('<?=lang('product_cost_is_required')?>');
        $('#mError-con').show();
        return false;
    }
    if (!$('#mprice').val()) {
        $('#mError').text('<?=lang('product_price_is_required')?>');
        $('#mError-con').show();
        return false;
    }

    var msg, row = null, product = {
        type: 'standard',
        code: $('#mcode').val(),
        name: $('#mname').val(),
        tax_rate: $('#mtax').val(),
        tax_method: $('#mtax_method').val(),
        category_id: $('#mcategory').val(),
        unit: $('#munit').val(),
        cost: $('#mcost').val(),
        price: $('#mprice').val()
    };

    $.ajax({
        type: "get", async: false,
        url: site.base_url + "products/addByAjax",
        data: {token: "<?= $csrf; ?>", product: product},
        dataType: "json",
        success: function (data) {
            if (data.msg == 'success') {
                row = add_purchase_item(data.result);
            } else {
                msg = data.msg;
            }
        }
    });
    if (row) {
        $('#mModal').modal('hide');
                //audio_success.play();
            } else {
                $('#mError').text(msg);
                $('#mError-con').show();
            }
            return false;

        });
$(window).bind('beforeunload', function (e) {
    $.get('<?=site_url('welcome/set_data/remove_pols/1');?>');
    if (count > 1) {
        var message = "You will lose data!";
        return message;
    }
});
$('#reset').click(function (e) {
    $(window).unbind('beforeunload');
});
$('#receive_pruchase').click(function () {
    $(window).unbind('beforeunload');
    //$('form.receive-po-form').submit();
});

});


</script>

<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-edit"></i><?= lang('purchases_receive'); ?></h2>
    </div>
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">

                <p class="introtext"><?php echo lang('enter_info'); ?></p>
                <?php
                $attrib = array('data-toggle' => 'validator', 'role' => 'form', 'class' => 'receive-po-form');
                echo form_open_multipart("purchases/receive/" . $inv->id, $attrib)
                ?>


                <div class="row">
                    <div class="col-lg-12">
                        <div class="col-md-12" id="poform1-1">
                            <div class="panel panel-warning">
                                <!--<div
                                class="panel-heading"><?= lang('please_select_these_before_adding_product') ?></div>-->
                                <div class="panel-body" style="padding: 5px;">
                                    <!--<div class="col-md-4">
                                        <div class="form-group">
                                            <?= lang("currency", "pocurrency"); ?>
                                            <?php /*
                                            $wh[''] = '';
                                            foreach ($currencies as $currency) {
                                                $cur[$currency->code] = $currency->name;
                                            }
                                            echo form_dropdown('currency', $cur, (isset($_POST['currency']) ? $_POST['currency'] : $Settings->currency_code), 'id="pocurrency" class="form-control input-tip select" required="required" style="width:100%;" ');
                                            */ ?>
                                        </div>
                                    </div>-->
                                    <?php //if ($Owner || $Admin) { ?>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <?= lang("date", "podate"); ?>
                                            <?php echo form_input('date', (isset($_POST['date']) ? $_POST['date'] : ""), 'class="form-control input-tip datetime" id="podate" required="required"'); ?>
                                        </div>
                                    </div>
                                    <?php //} ?>
                                    <!-- <div class="col-md-4">
                                        <div class="form-group">
                                            <?= lang("supplier", "posupplier"); ?>
                                            <div class="input-group">
                                                <input type="hidden" name="supplier" value="" id="posupplier"
                                                class="form-control" style="width:100%;"
                                                placeholder="<?= lang("select") . ' ' . lang("supplier") ?>">

                                                <div class="input-group-addon"
                                                style="padding-left: 10px; padding-right: 10px;"><a href="#"
                                                id="removeReadonly"><i
                                                class="fa fa-unlock" id="unLock"></i></a></div>
                                            </div>
                                            <input type="hidden" name="supplier_id" value="" id="supplier_id"
                                            class="form-control">
                                        </div>
                                    </div> -->



                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <?= lang("warehouse", "powarehouse"); ?>
                                            <?php
                                            $wh[''] = '';
                                            foreach ($warehouses as $warehouse) {
                                                $wh[$warehouse->id] = $warehouse->name;
                                            }
                                            echo form_dropdown('warehouse', $wh, (isset($_POST['warehouse']) ? $_POST['warehouse'] : $Settings->default_warehouse), 'id="powarehouse" class="form-control input-tip select" data-placeholder="' . $this->lang->line("select") . ' ' . $this->lang->line("warehouse") . '" required="required" style="width:100%;" ');
                                            ?>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <?= lang("rr_no", "rrno"); ?>
                                            <?php echo form_input('rr_no', (isset($_POST['rr_no']) ? $_POST['rr_no'] : $rr_no), 'class="form-control input-tip" id="rrno" required="required"'); ?>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <?= lang("invoice_no", "invoiceno"); ?>
                                            <?php echo form_input('invoice_no', (isset($_POST['invoice_no']) ? $_POST['invoice_no'] : $invoice_no), 'class="form-control input-tip" id="invoiceno" required="required"'); ?>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <?= lang("supplier_po", "supplier_po"); ?>
                                            <?php echo form_input('supplier_po', (isset($_POST['supplier_po']) ? $_POST['supplier_po'] : $invoice_no), 'class="form-control input-tip" id="supplier_po" required="required"'); ?>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <?= lang("received_by", "poreceivedby"); ?>
                                            <?php echo form_input('received_by', (isset($_POST['received_by']) ? $_POST['received_by'] : $received_by), 'class="form-control input-tip" id="poreceivedby" required="required"'); ?>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <?= lang("status", "postatus"); ?>
                                            <?php
                                            $post = array('complete' => lang('complete'), 'pending' => lang('pending'), 'partial' => lang('partial'));
                                            echo form_dropdown('status', $post, (isset($_POST['status']) ? $_POST['status'] : ''), 'id="postatus" class="form-control input-tip select" data-placeholder="' . $this->lang->line("select") . ' ' . $this->lang->line("status") . '" required="required" style="width:100%;" ');
                                            ?>
                                        </div>
                                    </div>

                                    <!-- <div class="col-md-4">
                                        <div class="form-group">
                                            <?= lang("prf_no", "rrno"); ?>
                                            <?php echo form_input('rr_no', (isset($_POST['rr_no']) ? $_POST['rr_no'] : ""), 'class="form-control input-tip" id="rrno" required="required"'); ?>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <?= lang("mrf_no", "mrfno"); ?>
                                            <?php echo form_input('mrf_no', (isset($_POST['mrf_no']) ? $_POST['mrf_no'] : ""), 'class="form-control input-tip" id="mrfno" required="required"'); ?>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <?= lang("jo_no", "poref"); ?>
                                            <?php echo form_input('reference_no', (isset($_POST['reference_no']) ? $_POST['reference_no'] : ""), 'class="form-control input-tip" id="poref" required="required"'); ?>
                                        </div>
                                    </div> -->

                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <!-- <div class="col-md-12"><button type="button" class="btn btn-primary" id="showForm2"><?= lang('Next') ?></button></div> -->
                        </div>

                        <div>
                            <div class="col-md-12" id="sticker">
                                <div class="well well-sm">
                                    <div class="form-group" style="margin-bottom:0;">
                                        <div class="input-group wide-tip">
                                            <div class="input-group-addon" style="padding-left: 10px; padding-right: 10px;">
                                                <i class="fa fa-2x fa-barcode addIcon"></i></a></div>
                                                <?php echo form_input('add_item', '', 'class="form-control input-lg" id="add_item" placeholder="' . $this->lang->line("add_product_to_order") . '"'); ?>
                                                <div class="input-group-addon" style="padding-left: 10px; padding-right: 10px;">
                                                    <a href="#" id="addManually"><i class="fa fa-2x fa-plus-circle addIcon"
                                                        id="addIcon"></i></a></div>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="control-group table-group">
                                                <label class="table-label"><?= lang("order_items"); ?></label>

                                                <div class="controls table-controls">
                                                    <table id="poTable"
                                                    class="table items table-striped table-bordered table-condensed table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th class="col-md-4"><?= lang("product_name") . " (" . $this->lang->line("product_code") . ")"; ?></th>
                                                            <th class="col-md-1"><?= lang("net_unit_cost"); ?></th>
                                                            <th class="col-md-1"><?= lang("quantity"); ?></th>
                                                            <th class="col-md-1"><?= lang("received"); ?></th>
<!--                                                            <th class="col-md-3">--><?//= lang("supplier_tin"); ?><!--</th>-->
                                                            <?php
                                                            if ($Settings->product_expiry) {
                                                                echo '<th class="col-md-2">' . $this->lang->line("expiry_date") . '</th>';
                                                            }
                                                            ?>
                                                            <?php
                                                            if ($Settings->product_discount) {
                                                                echo '<th class="col-md-1">' . $this->lang->line("discount") . '</th>';
                                                            }
                                                            ?>
                                                            <?php
                                                            if ($Settings->tax1) {
                                                                echo '<th class="col-md-1">' . $this->lang->line("product_tax") . '</th>';
                                                            }
                                                            ?>
                                                            <th><?= lang("subtotal"); ?> (<span
                                                                class="currency"><?= $default_currency->code ?></span>)
                                                            </th>
                                                            <th style="width: 30px !important; text-align: center;"><i
                                                                class="fa fa-trash-o"
                                                                style="opacity:0.5; filter:alpha(opacity=50);"></i></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody></tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <input type="hidden" name="total_items" value="" id="total_items" required="required"/>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <input type="checkbox" class="checkbox" id="extras" value=""/><label for="extras"
                                                class="padding05"><?= lang('more_options') ?></label>
                                            </div>
                                            <div class="row" id="extras-con" style="display: none;">
                                                <?php if ($Settings->tax1) { ?>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <?= lang('order_tax', 'potax2') ?>
                                                        <?php
                                                        $tr[""] = "";
                                                        foreach ($tax_rates as $tax) {
                                                            $tr[$tax->id] = $tax->name;
                                                        }
                                                        echo form_dropdown('order_tax', $tr, "", 'id="potax2" class="form-control input-tip select" style="width:100%;"');
                                                        ?>
                                                    </div>
                                                </div>
                                                <?php } ?>

                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <?= lang("discount_label", "podiscount"); ?>
                                                        <?php echo form_input('discount', '', 'class="form-control input-tip" id="podiscount"'); ?>
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="form-group" style="margin-bottom:5px;">
                                                        <?= lang("shipping", "poshipping"); ?>
                                                        <?php echo form_input('shipping', '', 'class="form-control input-tip" id="poshipping"'); ?>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>

                                        </div>

                                       <!--  <div class="col-md-12">
                                            <button type="button" class="btn btn-danger" id="backtoform1"><?= lang('Back') ?></button>
                                            <button type="button" class="btn btn-primary" id="showForm3"><?= lang('Next') ?></button>
                                        </div> -->
                                    </div>
                                </div>
                            </div>


                            <div id="poform3-1" class="col-md-12">
                                <div id="bottom-total" class="well well-sm" style="margin-bottom: 0;">
                                    <table class="table table-bordered table-condensed totals" style="margin-bottom:0;">
                                        <tr class="warning">
                                            <td><?= lang('items') ?> <span class="totals_val pull-right" id="titems">0</span></td>
                                            <td><?= lang('total') ?> <span class="totals_val pull-right" id="total">0.00</span></td>
                                            <?php if ($Settings->tax1) { ?>
                                            <td><?= lang('product_tax') ?> <span class="totals_val pull-right"
                                               id="ttax1">0.00</span></td>
                                               <?php } ?>
                                               <td><?= lang('discount') ?> <span class="totals_val pull-right" id="tds">0.00</span></td>
                                               <?php if ($Settings->tax2) { ?>
                                               <td><?= lang('order_tax') ?> <span class="totals_val pull-right" id="ttax2">0.00</span>
                                               </td>
                                               <?php } ?>
                                               <td><?= lang('grand_total') ?> <span class="totals_val pull-right" id="gtotal">0.00</span>
                                               </td>
                                           </tr>
                                       </table>
                                   </div>
                                   <div class="form-group">
                                    <?= lang("note", "rrnote"); ?>
                                    <?php echo form_textarea('note', (isset($_POST['note']) ? $_POST['note'] : ""), 'class="form-control" id="rrnote" style="margin-top: 10px; height: 100px;"'); ?>
                                    </div>
                            <!-- <div class="col-md-4">
                                <div class="form-group">
                                    <?= lang("reference_no", "poref"); ?>
                                    <?php echo form_input('reference_no', (isset($_POST['reference_no']) ? $_POST['reference_no'] : $ponumber), 'class="form-control input-tip" id="poref" required="required"'); ?>
                                </div>
                            </div> -->

                            <!-- <div class="col-md-4">
                                <div class="form-group">
                                    <?= lang("rr_no", "rrno"); ?>
                                    <?php echo form_input('rr_no', (isset($_POST['rr_no']) ? $_POST['rr_no'] : $rr_no), 'class="form-control input-tip" id="rrno" required="required"'); ?>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <?= lang("invoice_no", "invoiceno"); ?>
                                    <?php echo form_input('invoice_no', (isset($_POST['invoice_no']) ? $_POST['invoice_no'] : $invoice_no), 'class="form-control input-tip" id="invoiceno" required="required"'); ?>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <?= lang("mrf_no", "mrfno"); ?>
                                    <?php echo form_input('mrf_no', (isset($_POST['mrf_no']) ? $_POST['mrf_no'] : $mrf_no), 'class="form-control input-tip" id="mrfno" required="required"'); ?>
                                </div>
                            </div> -->
<!-- 
                            <div class="col-md-4">
                                <div class="form-group">
                                    <?= lang("received_by", "poreceivedby"); ?>
                                    <?php echo form_input('received_by', (isset($_POST['received_by']) ? $_POST['received_by'] : $received_by), 'class="form-control input-tip" id="poreceivedby" required="required"'); ?>
                                </div>
                            </div> -->

                                <div class="col-md-12">
                                    <div class="from-group">

                                    <!-- <button type="button" class="btn btn-danger" id="backtoform2"><?= lang('Back') ?></button> -->
                                    <?php echo form_submit('receive_pruchase', $this->lang->line("submit"), 'id="receive_pruchase" class="btn btn-success" style="padding: 6px 15px; margin:15px 0;"'); ?>
                                    <!--<button type="button" class="btn btn-default" id="reset"><?= lang('reset') ?></button-->                                    </div>
                                </div>
                        </div>

                        <?php echo form_close(); ?>

                    </div>

                </div>
            </div>
        </div>

        <div class="modal" id="prModal" tabindex="-1" role="dialog" aria-labelledby="prModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"><i
                            class="fa fa-2x">&times;</i></span><span class="sr-only"><?=lang('close');?></span></button>
                            <h4 class="modal-title" id="prModalLabel"></h4>
                        </div>
                        <div class="modal-body" id="pr_popover_content">
                            <form class="form-horizontal" role="form">
                                <?php if ($Settings->tax1) { ?>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label"><?= lang('product_tax') ?></label>
                                    <div class="col-sm-8">
                                        <?php
                                        $tr[""] = "";
                                        foreach ($tax_rates as $tax) {
                                            $tr[$tax->id] = $tax->name;
                                        }
                                        echo form_dropdown('ptax', $tr, "", 'id="ptax" class="form-control pos-input-tip" style="width:100%;"');
                                        ?>
                                    </div>
                                </div>
                                <?php } ?>
                                <div class="form-group">
                                    <label for="pquantity" class="col-sm-4 control-label"><?= lang('quantity') ?></label>

                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="pquantity">
                                    </div>
                                </div>
                                <?php if ($Settings->product_expiry) { ?>
                                <div class="form-group">
                                    <label for="pexpiry" class="col-sm-4 control-label"><?= lang('product_expiry') ?></label>

                                    <div class="col-sm-8">
                                        <input type="text" class="form-control date" id="pexpiry">
                                    </div>
                                </div>
                                <?php } ?>
                                <div class="form-group">
                                    <label for="poption" class="col-sm-4 control-label"><?= lang('product_option') ?></label>

                                    <div class="col-sm-8">
                                        <div id="poptions-div"></div>
                                    </div>
                                </div>
                                <?php if ($Settings->product_discount) { ?>
                                <div class="form-group">
                                    <label for="pdiscount"
                                    class="col-sm-4 control-label"><?= lang('product_discount') ?></label>

                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="pdiscount">
                                    </div>
                                </div>
                                <?php } ?>
                                <div class="form-group">
                                    <label for="pcost" class="col-sm-4 control-label"><?= lang('net_unit_cost') ?></label>

                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="pcost">
                                    </div>
                                </div>
                                <input type="hidden" id="punit_cost" value=""/>
                                <input type="hidden" id="old_tax" value=""/>
                                <input type="hidden" id="old_qty" value=""/>
                                <input type="hidden" id="old_cost" value=""/>
                                <input type="hidden" id="row_id" value=""/>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" id="editItem"><?= lang('submit') ?></button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal" id="mModal" tabindex="-1" role="dialog" aria-labelledby="mModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"><i
                                class="fa fa-2x">&times;</i></span><span class="sr-only"><?=lang('close');?></span></button>
                                <h4 class="modal-title" id="mModalLabel"><?= lang('add_standard_product') ?></h4>
                            </div>
                            <div class="modal-body" id="pr_popover_content">
                                <div class="alert alert-danger" id="mError-con" style="display: none;">
                                    <!--<button data-dismiss="alert" class="close" type="button">×</button>-->
                                    <span id="mError"></span>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <?= lang('product_code', 'mcode') ?> *
                                            <input type="text" class="form-control" id="mcode">
                                        </div>
                                        <div class="form-group">
                                            <?= lang('product_name', 'mname') ?> *
                                            <input type="text" class="form-control" id="mname">
                                        </div>
                                        <div class="form-group">
                                            <?= lang('category', 'mcategory') ?> *
                                            <?php
                                            $cat[''] = "";
                                            foreach ($categories as $category) {
                                                $cat[$category->id] = $category->name;
                                            }
                                            echo form_dropdown('category', $cat, '', 'class="form-control select" id="mcategory" placeholder="' . lang("select") . " " . lang("category") . '" style="width:100%"')
                                            ?>
                                        </div>
                                        <div class="form-group">
                                            <?= lang('unit', 'munit') ?> *
                                            <input type="text" class="form-control" id="munit">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <?= lang('cost', 'mcost') ?> *
                                            <input type="text" class="form-control" id="mcost">
                                        </div>
                                        <div class="form-group">
                                            <?= lang('price', 'mprice') ?> *
                                            <input type="text" class="form-control" id="mprice">
                                        </div>

                                        <?php if ($Settings->tax1) { ?>
                                        <div class="form-group">
                                            <?= lang('product_tax', 'mtax') ?>
                                            <?php
                                            $tr[""] = "";
                                            foreach ($tax_rates as $tax) {
                                                $tr[$tax->id] = $tax->name;
                                            }
                                            echo form_dropdown('mtax', $tr, "", 'id="mtax" class="form-control input-tip select" style="width:100%;"');
                                            ?>
                                        </div>
                                        <div class="form-group all">
                                            <?= lang("tax_method", "mtax_method") ?>
                                            <?php
                                            $tm = array('0' => lang('inclusive'), '1' => lang('exclusive'));
                                            echo form_dropdown('tax_method', $tm, '', 'class="form-control select" id="mtax_method" placeholder="' . lang("select") . ' ' . lang("tax_method") . '" style="width:100%"')
                                            ?>
                                        </div>
                                        <?php } ?>
                                    </div>
                                </div>


                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" id="addItemManually"><?= lang('submit') ?></button>
                            </div>
                        </div>
                    </div>
                </div>

