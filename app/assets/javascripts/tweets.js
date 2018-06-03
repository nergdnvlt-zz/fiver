var data = $('#tweets').data('tweets');
var wat_url = `/api/v1/watson`;

$('.get_watson_button').on('click', function() {
    fetch(wat_url, { method: 'POST',
                     body: data })
    .then(function(response) { return response.json(); })
    // .then(response => console.log('Success:', response))
    .then(function(tones){ tones.tones.forEach(
      tone => {
        $(`#watson_partial`).append(`<li>${tone.tone_name}</ul>`); }); });
});


// tones.tones.forEach(tone => {console.log(tone.tone_name)})
