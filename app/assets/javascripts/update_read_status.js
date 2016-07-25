function listenFor(element){
  $('body').children().delegate(element, "click", function(){
    let currentStatus = $(this).parent().children('#link-status').data('read-status');
    let parent = $(this).parent();
    let userId = parent.data('user-id');
    let linkId = parent.data('link-id');

    updateLinkReadStatus(userId, linkId, changeReadStatus(currentStatus), 'something went wrong with the update');
  });
}

function changeReadStatus(currentStatus) {
  return { read: !currentStatus }
}

function updateLinkReadStatus (userId, linkId, patchReadStatusData, errorMessage){
  $.ajax({
    method: 'PATCH',
    url: '/api/v1/users/' + userId + '/links/'+ linkId + ".json",
    data: patchReadStatusData,
    dataType: "JSON",
    success: updateReadStatus,
    failure: function(req, status, err) {
      console.log(errorMessage, status, err);
    }
  });
}

function updateReadStatus(updateResponse){
  var newStatus = updateResponse.read;
  var currentObject = $('[data-link-id=' + updateResponse.id + ']');

  currentObject.children('#link-status').text(newStatus);
  currentObject.children('#link-status').data('read-status', newStatus);

  // writing to DOM for debugging purposes;
  currentObject.children('#link-status').attr('data-read-status', newStatus)

  var markButton = currentObject.children('#mark-btn');

  if ( markButton.data('btn-class') == "read") {
    markButton.text('Mark as Unread');
    markButton.data('btn-class', "unread");
    currentObject.children('#mark-btn')[0].style.backgroundColor = "red";
  } else {
    markButton.text('Mark as Read');
    markButton.data('btn-class', "read");
    currentObject.children('#mark-btn')[0].style.backgroundColor = "green";
  }
}
