$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});


$('#search').on('click', function(event){
  event.preventDefault();
  console.log(event);
  var searchData = $('.search-form').serialize()
  console.log(searchData);
  $.ajax({
    url: '/search'
    method: '/post'
    data: searchData
  })
  .done(function(searchData){
    
  })
})
