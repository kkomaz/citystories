$(function(){
  $('.vote').on('click', '#down', function(e){
    e.preventDefault();
    e.stopPropagation();

    var url = $(this).attr("href");
    var method = $(this).attr("data-method");

    $.ajax({
      method: method,
      url: url,
      dataType: "script"
    });
    
    $(this).blur();

  })
})