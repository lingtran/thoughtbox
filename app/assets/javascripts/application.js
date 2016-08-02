//= require jquery
//= require jquery_ujs
//= require_tree .


$(document).ready(function(){
  listenFor("#mark-btn");

  searchOnEvent("click");

  filterOnEventFor("click", "read-filter-button");
  filterOnEventFor("click", "unread-filter-button");



});
