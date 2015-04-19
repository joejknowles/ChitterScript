var $cheep_form = $('#send-cheep');
var $cheep_area = $('#cheeps-wrapper');

$cheep_form.on('submit', function (event) {
  event.preventDefault;
  $.ajax({
    url: 'cheeps/new',
    method: 'post',
    data: $(this).serialize()
  }).done(function (cheep) {
    $cheep_area.append(cheep);
  });
  return false;
});