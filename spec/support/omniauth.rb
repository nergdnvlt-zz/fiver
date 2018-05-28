# first, set OmniAuth to run in test mode
OmniAuth.config.test_mode = true
# then, provide a set of fake oauth data that
# omniauth will use when a user tries to authenticate:
OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
  'provider' => 'google_oauth2',
  'uid' => '888881111188888333338',
  'info' => {
    'name' => 'Thor Odinson',
    'email' => 'fatherwar@test.io',
    'first_name' => 'Thor',
    'last_name' => 'Odinson',
    'image' => 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/user/photo.jpg'
  },
  'credentials' => {
    'token' => 'ya29.GlzHBS1hF5MEo2EvHWJEbBEcINq4kxRThSG1u9k2ri',
    'expires_at' => 1_527_371_901,
    'expires' => true
  },
  'extra' => {
    'id_token' => 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjNiY2YwYjNjYzg2MmEwYWM3NzA5MmY3MmI0ZGZkYjIwYTgxMDBk',
    'raw_info' =>
            { 'id' => '888881111188888333338',
              'email' => 'fatherwar@test.io',
              'verified_email' => true,
              'name' => 'Thor Odinson',
              'given_name' => 'Thor',
              'family_name' => 'Odinson',
              'picture' => 'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/user/photo.jpg',
              'locale' => 'en' }
  }}
)
