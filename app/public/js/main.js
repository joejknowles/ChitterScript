var $register_form = $('#register');
var $sign_in_form = $('#sign-in');
var $sign_out_form = $('#sign-out');
var $cheep_form = $('#send-cheep')

if ($('#username').length > 0) {
  window.session = new Session($(this).text);
}

$register_form.on('submit', function (event) {
  event.preventDefault;
  var username = $('#register-username').val();
  $.ajax({
    url: '/users/new',
    method: 'post',
    data: $(this).serialize()
  }).done(function (data) {
    $('#message').text(data);
    $register_form.hide();
    $sign_in_form.hide();
    $sign_out_form.show();
    $cheep_form.show();
    window.session = new Session(username)
  }).fail(function (data) {
    $('#message').text(data.responseText);
  });
  return false;
});

$sign_in_form.on('submit', function (event) {
  event.preventDefault();
  var username = $('#sign-in-username').val();
  $.ajax({
    url: '/sessions/new',
    method: 'post',
    data: $(this).serialize()
  }).done(function (data) {
    $('#message').html(data);
    $register_form.hide();
    $sign_in_form.hide();
    $sign_out_form.show();
    $cheep_form.show();
    window.session = new Session(username)
  }).fail(function (data) {
    $('#message').text(data.responseText);
  });
  return false;
});

$sign_out_form.on('submit', function (event) {
  event.preventDefault();
  var username = window.session.username;
  $.ajax({
    url: '/sessions/end',
    method: 'post',
    data: {'username': username }
  }).done(function (data) {
    $('#message').text(data);
    $register_form.show();
    $sign_in_form.show();
    $sign_out_form.hide();
    $cheep_form.hide();
    window.session.leave();
  });
  return false;
});

