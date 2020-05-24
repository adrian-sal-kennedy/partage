yeet = function yeet(classToYeet,yeetClass) {
  var elements = document.getElementsByClassName(classToYeet);
  var blk = Array.prototype.filter.call(elements, function(element){
    element.classList.remove(yeetClass);
    void element.offsetWidth;
    element.classList.add(yeetClass);
  });
}
