yeet = function yeet(classToYeet,yeetclass) {
  var elements = document.getElementsByClassName(classToYeet);
  var blocky = Array.prototype.filter.call(elements, function(element){
    element.classList.remove(yeetclass);
    void element.offsetWidth;
    element.classList.add(yeetclass);
  });
}
