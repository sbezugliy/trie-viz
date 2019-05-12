document.addEventListener('DOMContentLoaded', function () {
  var elems = document.querySelectorAll('select');
  M.FormSelect.init(elems, ['full', 'flat', 'ac']);
});
$(document).ready(function () {
  M.AutoInit();
  // $('textarea').characterCounter();
  // M.textareaAutoResize($('textarea'));
  // $('select').formSelect();
});