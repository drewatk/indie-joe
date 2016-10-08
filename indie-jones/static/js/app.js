$(document).ready(function() {
  $('#search_btn').on('click', function() {
    var query =  $('#search').val()
    $.post('/search', { query: query}, function(data) {
      console.log(data);
    })
  })
})
