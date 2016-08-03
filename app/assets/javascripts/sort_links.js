function sortLinks(){
  var sortLinksButton = document.getElementById('sort-links-button');

  sortLinksButton.addEventListener("click", sort, false);
}

function sort() {
  var linksContent = $('.link-box').remove();

  var userId = document.querySelector('.link-lists').dataset.userId;
  renderSortedLinks(userId);
}

function renderSortedLinks(userId){
  $.ajax({
    type: 'GET',
    url: '/api/v1/users/' + userId + '/links' + '.json',
    dataType: 'JSON',
    success: orderLinks,
    error: function( req, status, err ) {
      console.log( 'something went wrong in retrieving links index', status, err );
    }
  });
}

function orderLinks(links) {
  console.table(links);

  links.forEach(function(object){
    $('.link-lists').append("<div class=link-box>" + "<p> Title: " + object.title + "</p>" + "<p> URL: " + object.url + "</p>" + "<p> Read? " + object.read + "</p>" + "</div><br></br>");
  });
}
