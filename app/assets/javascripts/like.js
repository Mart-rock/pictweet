$(document).on('turbolinks:load', function(){
  function buildHTML(like){
    var html = ` 
      <%= link_to "/tweets/#{tweet.id}/likes", method: :post, remote: true do %>
      <i class="far fa-heart heart-far">ハート</i>
      <% end %>
    
     <%= tweet.likes.length %>`
     return html;
  }
  $('.heart-far').on('submit', function(e){
    e.preventDefault();
    var message = new FormData(this);
    var url = (window.location.href); // $(this).attr('action')でも可能です
    $.ajax({  
      url: url,
      type: 'POST',
      data: message,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);

    })
    .fail(function(data){
      alert("erorr");
    })
  })
});