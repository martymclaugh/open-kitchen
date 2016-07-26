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
    url: '/search',
    method: 'POST',
    data: searchData
  })
  .done(function(response){
    // console.log(response.businesses[0]);
    // console.log(response.businesses.length);
      $('#name').empty().append(response.businesses[0].name)
      $('#address').empty().append(response.businesses[0].location.display_address[0])
      $('#city').empty().append(response.businesses[0].location.display_address[1])
      $('#zip').empty().append(response.businesses[0].location.display_address[2])
      $('#image').empty().append().attr('src', response.businesses[0].image_url).attr('alt', response.businesses[0].name )
      // $('#search-results').append(response.businesses.address)
  })
})
