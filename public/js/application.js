$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  addSearchDivs();
  createRestaurant();
  searchBar();
  displayCustomerReviews();
  displayEmployeeReviews();
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
// preform search function
searchBar = function(){
  $('#search').on('click', function(event){
    event.preventDefault();
    var searchData = $('.search-form').serialize()
    $.ajax({
      url: '/search',
      method: 'POST',
      data: searchData
    })
    .done(function(response){
        $('#restaurant_name').empty().append(response.businesses[0].name)
        $('#phone').empty().append(response.businesses[0].phone)
        $('#review-image').empty().append().attr('src', response.businesses[0].rating_img_url).attr('alt', response.businesses[0].rating + ' Stars' )
        $('#yelp_reviews').empty().append('Yelp Reviews: ' + response.businesses[0].review_count)
        $('#phone').empty().append(response.businesses[0].phone)
        $('#address').empty().append(response.businesses[0].location.display_address[0])
        $('#city').empty().append(response.businesses[0].location.display_address[1])
        $('#state').empty().append(response.businesses[0].location.display_address[2])
        $('#snippet').empty().append('Yelp Snippet Review: ' + response.businesses[0].snippet_text)
        $('#image').empty().append().attr('src', response.businesses[0].image_url).attr('alt', response.businesses[0].name )
    });
  });
};

// get the divs from search erb file
addSearchDivs = function(){
  $('#search').on('click', function(event){
    event.preventDefault();
    $.ajax({
      url: '/search',
      method: 'GET',
    })
    .done(function(response){
      console.log("ding!");
      $('body').append().html(response)
    })
    .fail(function(response){
      console.log('oops');
    });
  });
};

// create restaurant object
createRestaurant = function(){
  $('#create-restaurant').on('click', function(event){
    event.preventDefault();
    $("input[name='restaurant_name']").val($('#restaurant_name').html()),
    $("input[name='phone']").val($('#phone').html()),
    $("input[name='address']").val($('#address').html()),
    $("input[name='city']").val($('#city').html()),
    $("input[name='state']").val($('#state').html()),
    $("input[name='yelp_reviews']").val($('#yelp_reviews').html())
    var formData = $('#create-restaurant').serialize();
    console.log(formData);
    $.ajax({
      url: '/restaurants',
      method: 'POST',
      data: formData
      })
    .done(function(response){
      console.log("lalalala");
      $('#search-results').empty();
      $('#create-restaurant').empty();
      $('body').append(response);
    })
  })
};

displayCustomerReviews = function(){
  $('#customer-review-link').on('click', function(event){
    event.preventDefault();
  })
}

displayEmployeeReviews = function(){
  $('#employee-review-link').on('click', function(event){
    event.preventDefault();
    console.log(event);
  })
}
