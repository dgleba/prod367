$(function() {
  // run when eventlistener is triggered
  // http://stackoverflow.com/questions/6431459/jquery-autocomplete-trigger-change-event
  //

  console.log("msg.. 2019-08-16a");

  // add new followup comment line with date and put cursor in position to start typeing.
  // https://jsfiddle.net/dgable/mkut62Lp/
  //
  // $("#AddNewFollowup").click(function() {
  // $.fn.AddNewFollowup = function() {
  //
  $("#AddNewFollowup").click(function() {
    var text22 = $("#FollowupTextarea");

    /*     // get existing text in textarea
    var cursorPos = $('#text21').prop('selectionStart');
    var v = $('#text21').val();
    var textBefore = v.substring(0,  cursorPos );
    var textAfter  = v.substring( cursorPos, v.length );
    // $(this).val()    
     */

    var MyDate = new Date();
    var MyDateString;
    // MyDate.setDate(MyDate.getDate() + 0);
    MyDateString =
      ("0" + (MyDate.getMonth() + 1)).slice(-2) +
      "-" +
      ("0" + MyDate.getDate()).slice(-2);
    //alert(MyDateString)

    /* 
    text21.focus().val( MyDateString + ":  \nmore").setCursorPosition(7);
    text22.focus().val( MyDateString + ":  \n" + textBefore + textAfter ).setCursorPosition(7);
     */
    text22
      .focus()
      .val(MyDateString + ":  \n" + text22.val())
      .setCursorPosition(8);
  });

  //SET CURSOR POSITION
  $.fn.setCursorPosition = function(pos) {
    this.each(function(index, elem) {
      if (elem.setSelectionRange) {
        elem.setSelectionRange(pos, pos);
      } else if (elem.createTextRange) {
        var range = elem.createTextRange();
        range.collapse(true);
        range.moveEnd("character", pos);
        range.moveStart("character", pos);
        range.select();
      }
    });
    return this;
  };
});
