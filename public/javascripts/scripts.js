$(function() {
  $("a[rel^='external']").each(function() {
    $(this).attr("target","_blank");  
  });
});