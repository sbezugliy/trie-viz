document.addEventListener('DOMContentLoaded', function () {
  var elems = document.querySelectorAll('select');
  var instances = M.FormSelect.init(elems, options);
});
$(document).ready(function () {
  M.AutoInit();
  // $('textarea').characterCounter();
  // M.textareaAutoResize($('textarea'));
  // $('select').formSelect();
});