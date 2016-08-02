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
    $('.link-lists').append(
      "<div class=link-box data-link-id= " + object.id + " data-user-id=" + object.user_id + "data-link-url=" + object.url + " data-link-title=" + object.title + " data-read-status=" + object.read + ">" +
      'Title: <p id="title">' + object.title + "</p>" +
      "URL: <p>" + object.url + " </p>" +
      "Read?" + "<p data-read-status=" + object.read + ' id=link-status>' + object.read + "</p>" +
      "</div><br>"
    )
  })
}
