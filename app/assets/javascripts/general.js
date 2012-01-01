function fetch_object(url){
    $.ajax({
        type:"GET",
        url: url,
        datatype: "html",
        success: function (response) {
            $("#add_edit_form").html(response);
        }
    });
}
