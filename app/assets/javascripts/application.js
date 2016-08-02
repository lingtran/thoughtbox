//= require jquery
//= require jquery_ujs
//= require_tree .


$(document).ready(function(){
  listenFor("#mark-btn");



  searchOnEvent("click");

  function searchOnEvent(eventName){
    var searchButton = document.getElementById('search-button');
    searchButton.addEventListener(eventName, searchTerm, false);
  }

  function searchTerm(){
    var linksContent = document.querySelectorAll('.link-box');

    linksContent.forEach(checkLink);
  }

  function checkLink(element, index){
    var term = document.getElementById('search-box').value;
    // title seems incomplete, need to extract full content
    var title = element.dataset.linkTitle;
    var url = element.dataset.linkUrl;

    compareTerm(element, term, title, url);
  }

  function compareTerm (element, term, title, url){
    // add check if url includes text
    // compareWithTitle(title)
    // compareWith(URL)

    if (term === title || term === url) {
      $(element).hide();
    } else if ( term === "") {
      $(element).show();
    }
  }

});
