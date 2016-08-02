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
