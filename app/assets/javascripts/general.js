function fetch_object(url, replacer_id){
    jQuery.ajax({
        type:"GET",
        url: url,
        success: function (response) {
            jQuery('.add_form').hide();
            jQuery(replacer_id).html(response);
        }
    });
}

function set_cursor(id){
    $(id).focus();
}
