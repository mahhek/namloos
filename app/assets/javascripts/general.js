function fetch_object(url, replacer_id){
    jQuery.ajax({
        type:"GET",
        url: url,
        success: function (response) {
            jQuery('#add_edit_form').hide();
            jQuery(replacer_id).replaceWith(response);
        }
    });
}

function set_cursor(id){
    $(id).focus();
}
