function fetch_object(url){
    jQuery.ajax({
        type:"GET",
        url: url,
        success: function (response) {
            jQuery("#add_edit_form").html(response);
        }
    });
}
