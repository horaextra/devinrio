$(function() {
  $("ul#tabs li a").click(function(e) {
    e.preventDefault();
    $(".tab-content").fadeOut("fast");
    $("#"+$(this).attr("id").replace("nav_","")).fadeIn("fast");
    $("ul#tabs li a").removeClass("active");
    $(this).addClass("active");
  });
});
