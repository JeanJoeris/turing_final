var $newLinkTitle, $newLinkUrl, hotReadUrl;

$(document).ready(function(){

  $('#links-list').on('click', 'button.mark-unread', function(){
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');
    updateLinkToUnread(linkId)
    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: false}
    })
    .then( updateLinkToUnread.bind(this, linkId) );
  })
})

function updateLinkToUnread(linkId) {
  var targetLinkID = `#link-${linkId}`
  var $target = $(targetLinkID)
  $target.removeClass('read')
  $target.addClass('unread')
  $target.find('.link-read-status').text("false")
  changeButtonToUnread($target)
}

function changeButtonToUnread(target) {
  $targetButton = target.find('.mark-unread')
  $targetButton.text('Mark as Read')
  $targetButton.removeClass('mark-unread')
  $targetButton.addClass('mark-read')
}
