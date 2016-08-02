function searchOnEvent(eventName) {
  var searchButton = document.getElementById('search-button');

  searchButton.addEventListener(eventName, searchTerm, false);
}

function searchTerm() {
  var linksContent = document.querySelectorAll('.link-box');
  linksContent.forEach(checkLink);
}

function checkLink(element, index) {
  var term = document.getElementById('search-box').value;
  var title = element.childNodes[1].innerHTML;
  var url = element.dataset.linkUrl;

  if ( title.includes(term) || url.includes(term)) {
    $(element).show()
  } else {
    $(element).hide();
  }
}
