var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){

  $('#links-list').on('click', 'button.mark-read', function(){
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: true}
    })
    .then( createReadEntry )
    .then( updateLink );
  })
})

function createReadEntry(link) {
  linkId = link.id

  $.ajax({
    url: "http://localhost:4000/api/v1/read",
    method: 'POST',
    data: {link_id: linkId},
    type: 'json'
  })
}

function updateLink(link) {

}
