$(document).ready(function (e) {

    var $customer = $('#slcustomer');
    $customer.change(function (e) {
        localStorage.setItem('slcustomer', $(this).val());
        //$('#slcustomer_id').val($(this).val());
    });
    if (slcustomer = localStorage.getItem('slcustomer')) {
        $customer.val(slcustomer).select2({
            minimumInputLength: 1,
            data: [],
            initSelection: function (element, callback) {
                $.ajax({
                    type: "get", async: false,
                    url: site.base_url+"customers/getCustomer/" + $(element).val(),
                    dataType: "json",
                    success: function (data) {
                        callback(data[0]);
                    }
                });
            },
            ajax: {
                url: site.base_url + "customers/suggestions",
                dataType: 'json',
                quietMillis: 15,
                data: function (term, page) {
                    return {
                        term: term,
                        limit: 10
                    };
                },
                results: function (data, page) {
                    if (data.results != null) {
                        return {results: data.results};
                    } else {
                        return {results: [{id: '', text: 'No Match Found'}]};
                    }
                }
            }
        });
        if (count > 1) {
            $customer.select2("readonly", true);
            $customer.val(slcustomer);
            $('#slwarehouse').select2("readonly", true);
            //$('#slcustomer_id').val(slcustomer);
        }
    } else {
        nsCustomer();
    }

// Order level shipping and discount localStorage 
if (sldiscount = localStorage.getItem('sldiscount')) {
	$('#sldiscount').val(sldiscount);
}
$('#sltax2').change(function (e) {
	localStorage.setItem('sltax2', $(this).val());
});
if (sltax2 = localStorage.getItem('sltax2')) {
	$('#sltax2').select2("val", sltax2);
}
$('#slsale_status').change(function (e) {
	localStorage.setItem('slsale_status', $(this).val());
});
if (slsale_status = localStorage.getItem('slsale_status')) {
	$('#slsale_status').select2("val", slsale_status);
}
	if (mrf_no = localStorage.getItem('mrf_no')) {
		$('#mrfno').val(mrf_no);
	}
        if (customer_po = localStorage.getItem('customer_po')) {
		$('#customer_po').val(customer_po);
	}
	if (jo_no = localStorage.getItem('jo_no')) {
		$('#jono').val(jo_no);
	}
	if (prepared_by = localStorage.getItem('prepared_by')) {
		$('#prepared_by').val(prepared_by);
	}
	if (issued_to = localStorage.getItem('issued_to')) {
		$('#issued_to').val(issued_to);
	}
$('#slpayment_status').change(function (e) {
	var ps = $(this).val();
	localStorage.setItem('slpayment_status', ps);
	if (ps == 'partial' || ps == 'paid') {
		if(ps == 'paid') {
			$('#amount_1').val(formatDecimal(getNumber($('#gtotal').text())));
		}
		$('#payments').slideDown();
		$('#pcc_no_1').focus();
	} else {
		$('#payments').slideUp();
	}
});
if (slpayment_status = localStorage.getItem('slpayment_status')) {
	$('#slpayment_status').select2("val", slpayment_status);
	var ps = slpayment_status;
	if (ps == 'partial' || ps == 'paid') {
		$('#payments').slideDown();
		$('#pcc_no_1').focus();
	} else {
		$('#payments').slideUp();
	}
}

$(document).on('change', '.paid_by', function () {
	var p_val = $(this).val();
	localStorage.setItem('paid_by', p_val);
	$('#rpaidby').val(p_val);
	if (p_val == 'cash' ||  p_val == 'other') {
		$('.pcheque_1').hide();
		$('.pcc_1').hide();
		$('.pcash_1').show();
		$('#payment_note_1').focus();
	} else if (p_val == 'CC') {
		$('.pcheque_1').hide();
		$('.pcash_1').hide();
		$('.pcc_1').show();
		$('#pcc_no_1').focus();
	} else if (p_val == 'Cheque') {
		$('.pcc_1').hide();
		$('.pcash_1').hide();
		$('.pcheque_1').show();
		$('#cheque_no_1').focus();
	} else {
		$('.pcheque_1').hide();
		$('.pcc_1').hide();
		$('.pcash_1').hide();
	}
	if (p_val == 'gift_card') {
		$('.gc').show();
		$('.ngc').hide();
		$('#gift_card_no').focus();
	} else {
		$('.ngc').show();
		$('.gc').hide();
		$('#gc_details').html('');
	}
});

if (paid_by = localStorage.getItem('paid_by')) {
	var p_val = paid_by;
	$('.paid_by').select2("val", paid_by);
	$('#rpaidby').val(p_val);
	if (p_val == 'cash' ||  p_val == 'other') {
		$('.pcheque_1').hide();
		$('.pcc_1').hide();
		$('.pcash_1').show();
		$('#payment_note_1').focus();
	} else if (p_val == 'CC') {
		$('.pcheque_1').hide();
		$('.pcash_1').hide();
		$('.pcc_1').show();
		$('#pcc_no_1').focus();
	} else if (p_val == 'Cheque') {
		$('.pcc_1').hide();
		$('.pcash_1').hide();
		$('.pcheque_1').show();
		$('#cheque_no_1').focus();
	} else {
		$('.pcheque_1').hide();
		$('.pcc_1').hide();
		$('.pcash_1').hide();
	}
	if (p_val == 'gift_card') {
		$('.gc').show();
		$('.ngc').hide();
		$('#gift_card_no').focus();
	} else {
		$('.ngc').show();
		$('.gc').hide();
		$('#gc_details').html('');
	}
}

if (gift_card_no = localStorage.getItem('gift_card_no')) {
	$('#gift_card_no').val(gift_card_no);
}
$('#gift_card_no').change(function (e) {
	localStorage.setItem('gift_card_no', $(this).val());
});

if (amount_1 = localStorage.getItem('amount_1')) {
	$('#amount_1').val(amount_1);
}
$('#amount_1').change(function (e) {
	localStorage.setItem('amount_1', $(this).val());
});

if (paid_by_1 = localStorage.getItem('paid_by_1')) {
	$('#paid_by_1').val( paid_by_1);
}
$('#paid_by_1').change(function (e) {
	localStorage.setItem('paid_by_1', $(this).val());
});

if (pcc_holder_1 = localStorage.getItem('pcc_holder_1')) {
	$('#pcc_holder_1').val(pcc_holder_1);
}
$('#pcc_holder_1').change(function (e) {
	localStorage.setItem('pcc_holder_1', $(this).val());
});

if (pcc_type_1 = localStorage.getItem('pcc_type_1')) {
	$('#pcc_type_1').select2("val", pcc_type_1);
}
$('#pcc_type_1').change(function (e) {
	localStorage.setItem('pcc_type_1', $(this).val());
});

if (pcc_month_1 = localStorage.getItem('pcc_month_1')) {
	$('#pcc_month_1').val( pcc_month_1);
}
$('#pcc_month_1').change(function (e) {
	localStorage.setItem('pcc_month_1', $(this).val());
});

if (pcc_year_1 = localStorage.getItem('pcc_year_1')) {
	$('#pcc_year_1').val(pcc_year_1);
}
$('#pcc_year_1').change(function (e) {
	localStorage.setItem('pcc_year_1', $(this).val());
});

if (pcc_no_1 = localStorage.getItem('pcc_no_1')) {
	$('#pcc_no_1').val(pcc_no_1);
}
$('#pcc_no_1').change(function (e) {
	var pcc_no = $(this).val();
	localStorage.setItem('pcc_no_1', pcc_no);
	var CardType = null;
	var ccn1 = pcc_no.charAt(0);
	if(ccn1 == 4)
		CardType = 'Visa';
	else if(ccn1 == 5)
		CardType = 'MasterCard';	
	else if(ccn1 == 3)
		CardType = 'Amex';
	else if(ccn1 == 6)
		CardType = 'Discover';
	else
		CardType = 'Visa';

	$('#pcc_type_1').select2("val", CardType);
});

if (cheque_no_1 = localStorage.getItem('cheque_no_1')) {
	$('#cheque_no_1').val(cheque_no_1);
}
$('#cheque_no_1').change(function (e) {
	localStorage.setItem('cheque_no_1', $(this).val());
});

if (payment_note_1 = localStorage.getItem('payment_note_1')) {
	$('#payment_note_1').redactor('set', payment_note_1);
}
$('#payment_note_1').redactor('destroy');
$('#payment_note_1').redactor({
	buttons: ['formatting', '|', 'alignleft', 'aligncenter', 'alignright', 'justify', '|', 'bold', 'italic', 'underline', '|', 'unorderedlist', 'orderedlist', '|', 'link', '|', 'html'],
	formattingTags: ['p', 'pre', 'h3', 'h4'],
	minHeight: 100,
	changeCallback: function (e) {
		var v = this.get();
		localStorage.setItem('payment_note_1', v);
	}
});

var old_payment_term;
$('#slpayment_term').focus(function () {
	old_payment_term = $(this).val();
}).change(function (e) {
	var new_payment_term = $(this).val() ? parseFloat($(this).val()) : 0;
	if (!is_numeric($(this).val())) {
		$(this).val(old_payment_term);
		bootbox.alert('Unexpected value provided!');
		return;
	} else {
		localStorage.setItem('slpayment_term', new_payment_term);
		$('#slpayment_term').val(new_payment_term);
	}
});
if (slpayment_term = localStorage.getItem('slpayment_term')) {
	$('#slpayment_term').val(slpayment_term);
}

var old_shipping;
$('#slshipping').focus(function () {
	old_shipping = $(this).val();
}).change(function () {
	if (!is_numeric($(this).val())) {
		$(this).val(old_shipping);
		bootbox.alert('Unexpected value provided!');
		return;
	} else {
		shipping = $(this).val() ? parseFloat($(this).val()) : '0';
	}
	localStorage.setItem('slshipping', shipping);
	var gtotal = ((total + product_tax + invoice_tax) - total_discount) + shipping;
	$('#gtotal').text(formatMoney(gtotal));
});
if (slshipping = localStorage.getItem('slshipping')) {
	shipping = parseFloat(slshipping);
	$('#slshipping').val(shipping);
} else {
	shipping = 0;
}
if (count < 1) {
	$('#add_item').attr('required', 'required');
	$('form[data-toggle="validator"]').bootstrapValidator('addField', 'add_item');
}
$(document).on('change', '.rserial', function () {
	var item_id = $(this).closest('tr').attr('data-item-id');
	slitems[item_id].row.serial = $(this).val();
	localStorage.setItem('slitems', JSON.stringify(slitems));
});

// If there is any item in localStorage
if (localStorage.getItem('slitems')) {
	loadItems();
}

	// clear localStorage and reload
	$('#reset').click(function (e) {
		bootbox.confirm("Are you sure?", function (result) {
			if (result) {
				if (localStorage.getItem('slitems')) {
					localStorage.removeItem('slitems');
				}
				if (localStorage.getItem('sldiscount')) {
					localStorage.removeItem('sldiscount');
				}
				if (localStorage.getItem('sltax2')) {
					localStorage.removeItem('sltax2');
				}
				if (localStorage.getItem('slshipping')) {
					localStorage.removeItem('slshipping');
				}
				if (localStorage.getItem('slref')) {
					localStorage.removeItem('slref');
				}
				if (localStorage.getItem('slwarehouse')) {
					localStorage.removeItem('slwarehouse');
				}
				if (localStorage.getItem('slnote')) {
					localStorage.removeItem('slnote');
				}
				if (localStorage.getItem('slinnote')) {
					localStorage.removeItem('slinnote');
				}
				if (localStorage.getItem('slcustomer')) {
					localStorage.removeItem('slcustomer');
				}
				if (localStorage.getItem('slcurrency')) {
					localStorage.removeItem('slcurrency');
				}
				if (localStorage.getItem('sldate')) {
					localStorage.removeItem('sldate');
				}
				if (localStorage.getItem('slstatus')) {
					localStorage.removeItem('slstatus');
				}
				if (localStorage.getItem('slbiller')) {
					localStorage.removeItem('slbiller');
				}
				if (localStorage.getItem('gift_card_no')) {
					localStorage.removeItem('gift_card_no');
				}

				$('#modal-loading').show();
				location.reload();
			}
		});
});

// save and load the fields in and/or from localStorage

$('#slref').change(function (e) {
	localStorage.setItem('slref', $(this).val());
});
if (slref = localStorage.getItem('slref')) {
	$('#slref').val(slref);
}

$('#slwarehouse').change(function (e) {
	localStorage.setItem('slwarehouse', $(this).val());
});
if (slwarehouse = localStorage.getItem('slwarehouse')) {
	$('#slwarehouse').select2("val", slwarehouse);
}

	//$(document).on('change', '#slnote', function (e) {
		$('#slnote').redactor('destroy');
		$('#slnote').redactor({
			buttons: ['formatting', '|', 'alignleft', 'aligncenter', 'alignright', 'justify', '|', 'bold', 'italic', 'underline', '|', 'unorderedlist', 'orderedlist', '|', 'link', '|', 'html'],
			formattingTags: ['p', 'pre', 'h3', 'h4'],
			minHeight: 100,
			changeCallback: function (e) {
				var v = this.get();
				localStorage.setItem('slnote', v);
			}
		});
		if (slnote = localStorage.getItem('slnote')) {
			$('#slnote').redactor('set', slnote);
		}
		$('#slinnote').redactor('destroy');
		$('#slinnote').redactor({
			buttons: ['formatting', '|', 'alignleft', 'aligncenter', 'alignright', 'justify', '|', 'bold', 'italic', 'underline', '|', 'unorderedlist', 'orderedlist', '|', 'link', '|', 'html'],
			formattingTags: ['p', 'pre', 'h3', 'h4'],
			minHeight: 100,
			changeCallback: function (e) {
				var v = this.get();
				localStorage.setItem('slinnote', v);
			}
		});
		if (slinnote = localStorage.getItem('slinnote')) {
			$('#slinnote').redactor('set', slinnote);
		}

	/*
	 $currency.change(function (e) {
	 localStorage.setItem('slcurrency', $(this).val());
	 });
	 if (slcurrency = localStorage.getItem('slcurrency')) {
	 $currency.val(slcurrency);
	 //$currency.attr('disabled', 'disabled');
	 $currency.select2("readonly", true);
	 } else if (count > 1) {
	 localStorage.setItem('slcurrency', DC);
	 }
	 
	 $(document).on('change', '.rprice', function () { 
	 var item_id = $(this).closest('tr').attr('data-item-id');
	 slitems[item_id].row.net_price = $(this).val();
	 localStorage.setItem('slitems', JSON.stringify(slitems));
 });*/


// prevent default action usln enter
$('body').bind('keypress', function (e) {
	if (e.keyCode == 13) {
		e.preventDefault();
		return false;
	}
});

// Order tax calcuation 
if (site.settings.tax2 != 0) {
	$('#sltax2').change(function () {
		localStorage.setItem('sltax2', $(this).val());
		loadItems();
		return;
	});
}

// Order discount calcuation 
var old_sldiscount;
$('#sldiscount').focus(function () {
	old_sldiscount = $(this).val();
}).change(function () {
	var new_discount = $(this).val() ? $(this).val() : '0';
	if (is_valid_discount(new_discount)) {
		localStorage.removeItem('sldiscount');
		localStorage.setItem('sldiscount', new_discount);
		loadItems();
		return;
	} else {
		$(this).val(old_sldiscount);
		bootbox.alert('Unexpected value provided!');
		return;
	}

});


	/* ---------------------- 
	 * Delete Row Method 
	 * ---------------------- */
	$(document).on('click', '.sldel', function () {
		var row = $(this).closest('tr');
		var item_id = row.attr('data-item-id');
		delete slitems[item_id];
		row.remove();
		if(slitems.hasOwnProperty(item_id)) { } else {
			localStorage.setItem('slitems', JSON.stringify(slitems));
			loadItems();
			return;
		}
	});


	/* -----------------------
	 * Edit Row Modal Hanlder 
	 ----------------------- */
	 $(document).on('click', '.edit', function () {
		var row = $(this).closest('tr');
		var row_id = row.attr('id');
		item_id = row.attr('data-item-id');
		item = slitems[item_id];
		var qty = row.children().children('.rquantity').val(), 
		product_option = row.children().children('.roption').val(),
		price = formatDecimal(row.children().children('.rprice').val()),
		discount = row.children().children('.rdiscount').val();
		$('#prModalLabel').text(item.row.name + ' (' + item.row.code + ')');
		if (site.settings.tax1) {
			$('#ptax').select2('val', item.row.tax_rate);
	 		$('#old_tax').val(item.row.tax_rate);
	 		var item_discount = 0, ds = discount ? discount : '0';
	 		if (ds.indexOf("%") !== -1) {
	 			var pds = ds.split("%");
	 			if (!isNaN(pds[0])) {
	 				item_discount = parseFloat(((price) * parseFloat(pds[0])) / 100);
	 			} else {
	 				item_discount = parseFloat(ds);
	 			}
	 		} else {
	 			item_discount = parseFloat(ds);
	 		}
		 	var pr_tax_val = item.tax_rate ? ((price - item_discount) * parseFloat(item.tax_rate.rate)) / 100 : 0;
		}
		if (site.settings.product_serial !== 0) {
			$('#pserial').val(row.children().children('.rserial').val());
		}
		var opt = '<p style="margin: 12px 0 0 0;">n/a</p>';
		if(item.options !== false) {
			var o = 1;
			opt = $("<select id=\"poption\" name=\"poption\" class=\"form-control select\" />");
			$.each(item.options, function () {
				if(o == 1) {
					if(product_option == '') { product_variant = this.id; } else { product_variant = product_option; }
				}
				$("<option />", {value: this.id, text: this.name}).appendTo(opt);
				o++;
			});
		} 

		$('#poptions-div').html(opt);
		$('select.select').select2({minimumResultsForSearch: 6});
		$('#pquantity').val(qty);
		$('#old_qty').val(qty);
		$('#pprice').val(price);
		$('#punit_price').val(parseFloat(price)+parseFloat(pr_tax_val));
		$('#poption').select2('val', item.row.option);
		$('#old_price').val(price);
		$('#row_id').val(row_id);
		$('#item_id').val(item_id);
		$('#pserial').val(row.children().children('.rserial').val());
		$('#pdiscount').val(discount);
		$('#prModal').appendTo("body").modal('show');

	});

	$('#prModal').on('shown.bs.modal', function (e) {
		if($('#poption').select2('val') != '') {
			$('#poption').select2('val', product_variant);
			product_variant = 0;
		}
	});

	if(inclusive_tax_price_calculation == 1) {
		$('#prModal').on('change', '#ptax', function (e) {
			var row = $('#' + $('#row_id').val());
			var item_id = row.attr('data-item-id');
			if(slitems[item_id].row.item_tax_method == 0) {
				var pr_tax_rate = false, tax = $(this).val(), unit_price = $('#prModal').find('#punit_price').val();
				$.each(tax_rates, function () {
					if (this.id == tax) {
						pr_tax_rate = this;
					}
				});
				var pr_tax_val = (unit_price * parseFloat(pr_tax_rate.rate)) / (100 + parseFloat(pr_tax_rate.rate));
				$('#pprice').val(formatDecimal(unit_price - pr_tax_val));
			}
		});
	}

	/* -----------------------
	 * Edit Row Method 
	 ----------------------- */
	 $(document).on('click', '#editItem', function () {
		var row = $('#' + $('#row_id').val());
		var item_id = row.attr('data-item-id'), new_pr_tax = $('#ptax').val(), new_pr_tax_rate = {};
		if (new_pr_tax) {
			$.each(tax_rates, function () {
				if (this.id == new_pr_tax) {
					new_pr_tax_rate = this;
				}
			});
		} else {
			new_pr_tax_rate = false;
		}
		var price = parseFloat($('#pprice').val());
		if (site.settings.product_discount == 1) {
			if(!is_valid_discount($('#pdiscount').val()) || $('#pdiscount').val() > price) {
				bootbox.alert('Unexpected value provided!');
				return false;
			}
		}
		slitems[item_id].row.qty = parseFloat($('#pquantity').val()),
		slitems[item_id].row.price = price,
		slitems[item_id].row.tax_rate = new_pr_tax,
	 	slitems[item_id].tax_rate = new_pr_tax_rate,
		slitems[item_id].row.discount = $('#pdiscount').val() ? $('#pdiscount').val() : '',
		slitems[item_id].row.option = $('#poption').val() ? $('#poption').val() : '',
		slitems[item_id].row.tax_method = 1,
		slitems[item_id].row.serial = $('#pserial').val();
		localStorage.setItem('slitems', JSON.stringify(slitems));
		$('#prModal').modal('hide');
		
		loadItems();
		return;
	});

	/* -----------------------
	 * Product option change  
	 ----------------------- */
	 $(document).on('change', '#poption', function () {
		var row = $('#' + $('#row_id').val()), opt = $(this).val();
		var item_id = row.attr('data-item-id');
		var item = slitems[item_id];
		if(item.options !== false) {
			$.each(item.options, function () {
				if(this.id == opt && this.price != 0) {
					$('#pprice').val(this.price);
				}
			});
		} 
	});

	 /* ------------------------------
	 * Sell Gift Card modal 
	 ------------------------------- */
	 $(document).on('click', '#sellGiftCard', function (e) {
		if (count == 1) {
			slitems = {};
			if ($('#slwarehouse').val() && $('#slcustomer').val()) {
				$('#slcustomer').select2("readonly", true);
				$('#slwarehouse').select2("readonly", true);
			} else {
				bootbox.alert('Please select customer/warehouse');
				item = null;
				return false;
			}
		}
		$('#gcModal').appendTo("body").modal('show');
		return false;
	});

	 $(document).on('click', '#addGiftCard', function (e) {
		var mid = (new Date).getTime(),
		gccode = $('#gccard_no').val(),
		gcname = $('#gcname').val(),
		gcvalue = $('#gcvalue').val(),
		gccustomer = $('#gccustomer').val(),
		gcexpiry = $('#gcexpiry').val() ? $('#gcexpiry').val() : '',
		gcprice = parseFloat($('#gcprice').val());
		if(gccode == '' || gcvalue == '' || gcprice == '' || gcvalue == 0 || gcprice == 0) { 
			$('#gcerror').text('Please fill the required fields');
			$('.gcerror-con').show(); 
			return false; 
		}

		var gc_data = new Array();
		gc_data[0] = gccode;
		gc_data[1] = gcvalue;
		gc_data[2] = gccustomer;
		gc_data[3] = gcexpiry;
		//if (typeof slitems === "undefined") {
		//    var slitems = {};
		//}

		$.ajax({
			type: 'get',
			url: site.base_url+'sales/sell_gift_card',
			dataType: "json",
			data: { gcdata: gc_data },
			success: function (data) {
				if(data.result === 'success') {
					slitems[mid] = {"id": mid, "item_id": mid, "label": gcname + ' (' + gccode + ')', "row": {"id": mid, "code": gccode, "name": gcname, "quantity": 1, "price": gcprice, "tax_rate": 0, "qty": 1, "type": "manual", "discount": "0", "serial": "", "option":""}, "tax_rate": false, "options":false};
					localStorage.setItem('slitems', JSON.stringify(slitems));
					loadItems();
					$('#gcModal').modal('hide');
					$('#gccard_no').val('');
					$('#gcvalue').val('');
					$('#gcexpiry').val('');
					$('#gcprice').val('');
				} else {
					$('#gcerror').text(data.message);
					$('.gcerror-con').show();
				}
			}
		});
return false;
});

	/* ------------------------------
	 * Show manual item addition modal 
	 ------------------------------- */
	 $(document).on('click', '#addManually', function (e) {
		if (count == 1) {
			slitems = {};
			if ($('#slwarehouse').val() && $('#slcustomer').val()) {
				$('#slcustomer').select2("readonly", true);
				$('#slwarehouse').select2("readonly", true);
			} else {
				bootbox.alert('Please select customer/warehouse');
				item = null;
				return false;
			}
		}
		$('#mModal').appendTo("body").modal('show');
		return false;
	});

	 $(document).on('click', '#addItemManually', function (e) {
		var mid = (new Date).getTime(),
		mcode = $('#mcode').val(),
		mname = $('#mname').val(),
		mtax = parseInt($('#mtax').val()),
		mqty = parseFloat($('#mquantity').val()),
		mdiscount = $('#mdiscount').val() ? $('#mdiscount').val() : '0',
		mprice = parseFloat($('#mprice').val()),
		mtax_rate = {};
		$.each(tax_rates, function () {
			if (this.id == mtax) {
				mtax_rate = this;
			}
		});
		slitems[mid] = {"id": mid, "item_id": mid, "label": mname + ' (' + mcode + ')', "row": {"id": mid, "code": mcode, "name": mname, "quantity": mqty, "price": mprice, "tax_rate": mtax, "qty": mqty, "type": "manual", "discount": mdiscount, "serial": "", "option":""}, "tax_rate": mtax_rate, "options":false};
		localStorage.setItem('slitems', JSON.stringify(slitems));
		loadItems();
		$('#mModal').modal('hide');
		$('#mcode').val('');
		$('#mname').val('');
		$('#mtax').val('');
		$('#mquantity').val('');
		$('#mdiscount').val('');
		$('#mprice').val('');
		return false;
	});

	/* --------------------------
	 * Edit Row Quantity Method 
	 -------------------------- */
	 var old_row_qty;
	 $(document).on("focus", '.rquantity', function () {
		old_row_qty = $(this).val();
	}).on("change", '.rquantity', function () {
		var row = $(this).closest('tr');
		if (!is_numeric($(this).val())) {
			$(this).val(old_row_qty);
			bootbox.alert('Unexpected value provided!');
			return;
		}
		var new_qty = parseFloat($(this).val()),
		item_id = row.attr('data-item-id');
		slitems[item_id].row.qty = new_qty;
		localStorage.setItem('slitems', JSON.stringify(slitems));
		loadItems();
	});

	/* --------------------------
	 * Edit Row Price Method 
	 -------------------------- */
	 var old_price;
	 $(document).on("focus", '.rprice', function () {
		old_price = $(this).val();
	}).on("change", '.rprice', function () {
		var row = $(this).closest('tr');
		if (!is_numeric($(this).val())) {
			$(this).val(old_price);
			bootbox.alert('Unexpected value provided!');
			return;
		}
		var new_price = parseFloat($(this).val()),
		item_id = row.attr('data-item-id');
		slitems[item_id].row.price = new_price;
		localStorage.setItem('slitems', JSON.stringify(slitems));
		loadItems();
	});

	$(document).on("click", '#removeReadonly', function () {
		$('#slcustomer').select2('readonly', false);
		//$('#slwarehouse').select2('readonly', false);
		return false;
	});


});
/* -----------------------
 * Misc Actions
 ----------------------- */

// hellper function for customer if no localStorage value
function nsCustomer() {
	$('#slcustomer').select2({
		minimumInputLength: 1,
		ajax: {
			url: site.base_url + "customers/suggestions",
			dataType: 'json',
			quietMillis: 15,
			data: function (term, page) {
				return {
					term: term,
					limit: 10
				};
			},
			results: function (data, page) {
				if (data.results != null) {
					return {results: data.results};
				} else {
					return {results: [{id: '', text: 'No Match Found'}]};
				}
			}
		}
	});
}
//localStorage.clear();
function loadItems() {

	if (localStorage.getItem('slitems')) {
		total = 0;
		count = 1;
		an = 1;
		product_tax = 0;
		invoice_tax = 0;
		product_discount = 0;
		order_discount = 0;
		total_discount = 0;

		$("#slTable tbody").empty();
		slitems = JSON.parse(localStorage.getItem('slitems'));
		$('#add_sale, #edit_sale').attr('disabled', false);
		$.each(slitems, function () {
			var item = this;
			var item_id = site.settings.item_addition == 1 ? item.item_id : item.id;
			slitems[item_id] = item;

			var product_id = item.row.id, item_type = item.row.type, combo_items = item.combo_items, item_price = item.row.cost, item_qty = item.row.qty, item_aqty = item.row.quantity, item_tax_method = item.row.tax_method, item_ds = item.row.discount, item_discount = 0, item_option = item.row.option, item_code = item.row.code, item_serial = item.row.serial, item_name = item.row.name.replace(/"/g, "&#034;").replace(/'/g, "&#039;");

			var ds = item_ds ? item_ds : '0';
			if (ds.indexOf("%") !== -1) {
				var pds = ds.split("%");
				if (!isNaN(pds[0])) {
					item_discount = parseFloat(((item_price) * parseFloat(pds[0])) / 100);
				} else {
					item_discount = parseFloat(ds);
				}
			} else {
				item_discount = parseFloat(ds);
			}
			product_discount += parseFloat(item_discount * item_qty);

			var pr_tax = item.tax_rate;
			var pr_tax_val = 0, pr_tax_rate = 0;
			if (site.settings.tax1 == 1) {
				if (pr_tax !== false) {
					if (pr_tax.type == 1) {

						if (item_tax_method == '0') {
							pr_tax_val = ((item_price - item_discount) * parseFloat(pr_tax.rate)) / (100 + parseFloat(pr_tax.rate));
							pr_tax_rate = pr_tax.rate + '%';
							item_price -= pr_tax_val;
						} else {
							pr_tax_val = ((item_price - item_discount) * parseFloat(pr_tax.rate)) / 100;
							pr_tax_rate = pr_tax.rate + '%';
						}

					} else if (pr_tax.type == 2) {

						if (item_tax_method == '0') {
							pr_tax_val = parseFloat(pr_tax.rate);
							pr_tax_rate = pr_tax.rate;
						} else {
							pr_tax_val = parseFloat(pr_tax.rate);
							pr_tax_rate = pr_tax.rate;
						}

					}
					product_tax += pr_tax_val * item_qty;
				}
			}
			var sel_opt = '';
			$.each(item.options, function () {
				if(this.id == item_option) {
					sel_opt = this.name;
				}
			});
			var row_no = (new Date).getTime();
			var newTr = $('<tr id="row_' + row_no + '" class="row_' + item_id + '" data-item-id="' + item_id + '"></tr>');
			tr_html = '<td><input name="product_id[]" type="hidden" class="rid" value="' + product_id + '"><input name="product_type[]" type="hidden" class="rtype" value="' + item_type + '"><input name="product_code[]" type="hidden" class="rcode" value="' + item_code + '"><input name="product_name[]" type="hidden" class="rname" value="' + item_name + '"><input name="product_option[]" type="hidden" class="roption" value="' + item_option + '"><span class="sname" id="name_' + row_no + '">' + item_name + ' (' + item_code + ')'+(sel_opt != '' ? ' ('+sel_opt+')' : '')+'</span> <i class="pull-right fa fa-edit tip pointer edit" id="' + row_no + '" data-item="' + item_id + '" title="Edit" style="cursor:pointer;"></i></td>';
			tr_html += '<td class="text-right"><input class="form-control input-sm text-right rprice" name="net_price[]" type="hidden" id="price_' + row_no + '" value="' + formatDecimal(item_price) + '"><span class="text-right sprice" id="sprice_' + row_no + '">' + formatMoney(item_price) + '</span></td>';
			tr_html += '<td><input class="form-control text-center rquantity" name="quantity[]" type="text" value="' + formatDecimal(item_qty) + '" data-id="' + row_no + '" data-item="' + item_id + '" id="quantity_' + row_no + '" onClick="this.select();"></td>';
			if (site.settings.product_serial == 1) {
				tr_html += '<td class="text-right"><input class="form-control input-sm rserial" name="serial[]" type="text" id="serial_' + row_no + '" value="'+item_serial+'"></td>';
			}
			if (site.settings.product_discount == 1) {
				tr_html += '<td class="text-right"><input class="form-control input-sm rdiscount" name="product_discount[]" type="hidden" id="discount_' + row_no + '" value="' + item_ds + '"><span class="text-right sdiscount text-danger" id="sdiscount_' + row_no + '">' + formatMoney(0 - (item_discount * item_qty)) + '</span></td>';
			}
			if (site.settings.tax1 == 1) {
				tr_html += '<td class="text-right"><input class="form-control input-sm text-right rproduct_tax" name="product_tax[]" type="hidden" id="product_tax_' + row_no + '" value="' + pr_tax.id + '"><span class="text-right sproduct_tax" id="sproduct_tax_' + row_no + '">' + (pr_tax_rate ? '(' + pr_tax_rate + ')' : '') + ' ' + formatMoney(pr_tax_val * item_qty) + '</span></td>';
			}
			tr_html += '<td class="text-right"><span class="text-right ssubtotal" id="subtotal_' + row_no + '">' + formatMoney(((parseFloat(item_price) - item_discount + parseFloat(pr_tax_val)) * parseFloat(item_qty))) + '</span></td>';
			tr_html += '<td class="text-center"><i class="fa fa-times tip pointer sldel" id="' + row_no + '" title="Remove" style="cursor:pointer;"></i></td>';
			newTr.html(tr_html);
			newTr.prependTo("#slTable");
			total += parseFloat(item_price * item_qty);
			count += parseFloat(item_qty);
			an++;
			if (item_type == 'standard' && item.options !== false) {
				$.each(item.options, function () {
					if(this.id == item_option && item_qty > this.quantity) {
						$('#row_' + row_no).addClass('danger');
						if(site.settings.overselling != 1) { $('#add_sale, #edit_sale').attr('disabled', true); }
					}
				});
			} else if(item_type == 'standard' && item_qty > item_aqty) { 
				$('#row_' + row_no).addClass('danger');
				if(site.settings.overselling != 1) { $('#add_sale, #edit_sale').attr('disabled', true); }
			} else if (item_type == 'combo') {
				if(combo_items === false) { 
					$('#row_' + row_no).addClass('danger');
					if(site.settings.overselling != 1) { $('#add_sale, #edit_sale').attr('disabled', true); }
				} else {
					$.each(combo_items, function(){
					   if(parseFloat(this.quantity) < (parseFloat(this.qty)*item_qty)) {
						   $('#row_' + row_no).addClass('danger');
						   if(site.settings.overselling != 1) { $('#add_sale, #edit_sale').attr('disabled', true); }
					   } 
				   });
				}
			}  

		});
		// Order level discount calculations        
		if (sldiscount = localStorage.getItem('sldiscount')) {
			var ds = sldiscount;
			if (ds.indexOf("%") !== -1) {
				var pds = ds.split("%");
				if (!isNaN(pds[0])) {
					order_discount = parseFloat(((total + product_tax) * parseFloat(pds[0])) / 100);
				} else {
					order_discount = parseFloat(ds);
				}
			} else {
				order_discount = parseFloat(ds);
			}

			//total_discount += parseFloat(order_discount);
		}

		// Order level tax calculations    
		if (site.settings.tax2 != 0) {
			if (sltax2 = localStorage.getItem('sltax2')) {
				$.each(tax_rates, function () {
					if (this.id == sltax2) {
						if (this.type == 2) {
							invoice_tax = parseFloat(this.rate);
						}
						if (this.type == 1) {
							invoice_tax = parseFloat(((total + product_tax - order_discount) * this.rate) / 100);
						}
					}
				});
			}
		}
		total_discount = parseFloat(order_discount + product_discount);
		// Totals calculations after item addition
		var gtotal = parseFloat(((total + product_tax + invoice_tax) - total_discount) + shipping);
		$('#total').text(formatMoney(total));
		$('#titems').text((an - 1) + ' (' + (parseFloat(count) - 1) + ')');
		$('#total_items').val((parseFloat(count) - 1));
		//$('#tds').text('('+formatMoney(product_discount)+'+'+formatMoney(order_discount)+')'+formatMoney(total_discount));
		$('#tds').text(formatMoney(total_discount));
		if (site.settings.tax1) {
			$('#ttax1').text(formatMoney(product_tax));
		}
		if (site.settings.tax2 != 0) {
			$('#ttax2').text(formatMoney(invoice_tax));
		}
		$('#gtotal').text(formatMoney(gtotal));
		if (an > site.settings.bc_fix && site.settings.bc_fix != 0) {
			$("html, body").animate({scrollTop: $('#slTable').offset().top - 150}, 500);
			$(window).scrollTop($(window).scrollTop() + 1);
		}
		if (count > 1) {
			$('#add_item').removeAttr('required');
			$('form[data-toggle="validator"]').bootstrapValidator('removeField', 'add_item');
		}
		//audio_success.play();
	}
}

/* -----------------------------
 * Add Sale Order Item Function
 * @param {json} item
 * @returns {Boolean}
 ---------------------------- */
 function add_invoice_item(item) {

	if (count == 1) {
		slitems = {};
		if ($('#slwarehouse').val() && $('#slcustomer').val()) {
			$('#slcustomer').select2("readonly", true);
			$('#slwarehouse').select2("readonly", true);
		} else {
			bootbox.alert('Please select customer/warehouse');
			item = null;
			return;
		}
	}
	if (item == null) {
		return;
	}
	var item_id = site.settings.item_addition == 1 ? item.item_id : item.id;
	if (slitems[item_id]) {
		slitems[item_id].row.qty = parseFloat(slitems[item_id].row.qty) + 1;
	} else {
		slitems[item_id] = item;
	}
	
	localStorage.setItem('slitems', JSON.stringify(slitems));
	loadItems();
	return true;
}

if (typeof (Storage) === "undefined") {
	$(window).bind('beforeunload', function (e) {
		if (count > 1) {
			var message = "You will loss data!";
			return message;
		}
	});
}