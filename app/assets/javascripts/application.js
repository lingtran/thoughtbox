//= require jquery
//= require jquery_ujs
//= require_tree .


$(document).ready(function(){
  listenFor("#mark-btn");

  searchOnEvent("click");

  filterOnEventFor("click", "read-filter-button");
  filterOnEventFor("click", "unread-filter-button");

  function filterOnEventFor(eventName, selector) {
    var filterButton = document.getElementById(selector);

    if (selector === 'read-filter-button') {
      filterButton.addEventListener(eventName, filterUnread, false);
    } else {
      filterButton.addEventListener(eventName, filterRead, false);
    }
  }

  function filterUnread() {
    var unreadLinks = document.querySelectorAll("[data-read-status='false']");
    unreadLinks.forEach(element => $(element).hide());
  }


  function filterRead(){
    var readLinks = document.querySelectorAll("[data-read-status='true']");
    readLinks.forEach(element => $(element).hide());
  }



});
