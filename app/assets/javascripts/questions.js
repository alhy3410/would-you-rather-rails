$(function (){
  $('.question1' + question_id + 'input[type=checkbox]').click(function(){
    $(this).parent('form').submit();
    $('.question1 input[type=checkbox]').remove();
    $('.question2 input[type=checkbox]').remove();

  });



  $('.question2 input[type=checkbox]').click(function(){
    alert('clicked');
  });
});
