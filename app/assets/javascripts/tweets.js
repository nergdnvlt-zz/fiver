var wat_url = `/api/v1/watson`;
var market_url = `/api/v1/market`;

$.urlParam = function(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results==null){
       return null;
    }
    else{
       return decodeURI(results[1]) || 0;
    }
}

var crypto_id = $.urlParam('crypto_id');


$('.get_watson_button').on('click', function() {
  $(this).hide();
  fetch(wat_url, { method: 'POST',
                   body: crypto_id })
  .then(function(response) { return response.json(); })
  .then(function(tones){ tones.tones.forEach(
    tone => {
      $(`#watson_partial`).append(`<li class="tone-name">${tone.tone_name}</li>`);
    });
  });
});

$('.get_market_button').on('click', function() {
    fetch(market_url, { method: 'POST',
                        body: crypto_id })
    .then(function(response) { return response.json(); })
    .then(function(change){
      $('#market_partial').text(`${change.market_change}`)
    });
});


var els = document.getElementsByClassName('marketChange');
for (var i = 0; i < els.length; i++) {
  var cell = els[i];
  if (cell.textContent < 0) {
    cell.classList.remove('green')
  } else {
    cell.classList.add('green');
  }
}










// .then(response => console.log('Success:', response))
