var data = $('#tweets').data('tweets');
var wat_url = `/api/v1/watson`;

$('.get_watson_button').on('click', function() {
    $(this).hide();
    fetch(wat_url, { method: 'POST',
                     body: data })
    .then(function(response) { return response.json(); })
    // .then(response => console.log('Success:', response))
    .then(function(tones){ tones.tones.forEach(
      tone => {
        $(`#watson_partial`).append(`<li class="tone-name">${tone.tone_name}</li>`); }); });
});


// tones.tones.forEach(tone => {console.log(tone.tone_name)})
// <%=j image_tag Tone.find_by(tone_name: ${tone.tone_name}).url %>`)
