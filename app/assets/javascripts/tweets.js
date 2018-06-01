var data = $('#tweets').data('tweets');
var wat_url = `/api/v1/watson?text=${data}`;

$('.get_watson_button').on('click', function () {
    fetch(wat_url, { method: 'GET'
                    })
                    .then(res => res.json())
                    .catch(error => console.error('Error:', error))
                    .then(response => console.log('Success:', response));
});
