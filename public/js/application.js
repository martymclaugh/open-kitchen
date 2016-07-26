$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  searchBar();
  createComment();
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});

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
      console.log(response);
        $('#name').empty().append(response.businesses[0].name)
        $('#phone').empty().append(response.businesses[0].phone)
        $('#review-image').empty().append().attr('src', response.businesses[0].rating_img_url).attr('alt', response.businesses[0].rating + ' Stars' )
        $('#yelp-reviews').empty().append('Yelp Reviews: ' + response.businesses[0].review_count)
        $('#phone').empty().append(response.businesses[0].phone)
        $('#address').empty().append(response.businesses[0].location.display_address[0])
        $('#city').empty().append(response.businesses[0].location.display_address[1])
        $('#state').empty().append(response.businesses[0].location.display_address[2])
        $('#snippet').empty().append('Yelp Snippet Review: ' + response.businesses[0].snippet_text)
        $('#image').empty().append().attr('src', response.businesses[0].image_url).attr('alt', response.businesses[0].name )
    });
  });
};

createComment = function(){
  $('#create-comment').on('click', function(event){
    event.preventDefault();
    $("input[name='restaurant-name']").val($('#name').html()),
    $("input[name='phone']").val($('#phone').html()),
    $("input[name='address']").val($('#address').html()),
    $("input[name='city']").val($('#city').html()),
    $("input[name='state']").val($('#state').html()),
    $("input[name='yelp-reviews']").val($('#yelp-reviews').html())
    var formData = $('#create-comment')
    $.ajax({
      url: '/restaurants/new',
      method: 'POST',
      data: formData
      })
  })
};
