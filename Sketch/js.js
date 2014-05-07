$(document).ready(function(){
   makeGrid();

   function makeGrid(){
    $(".block").remove();
    var number = prompt("How many Rows?") 
    total = (number * number - 1);
  
    for(var i = 0; i <= total; i++){
      $(".container").append("<div class=\"inactive block\"></div>");
    }
    //divide width of container by the number of blocks to determine size of each block
    var size = parseInt($(".container").css("width"))/number ;
    //set block size
    $('.inactive').css('width',size);
    $('.inactive').css('height',size);
   }


  $(".inactive").on("mouseover", function(){
    $(this).addClass("active");
  })

$('#rand').click(function(e){
  e.preventDefault();
   $('.block').on("mouseover", function(){
    var red = Math.ceil(Math.random() * 255);
    var green = Math.ceil(Math.random() * 255);
    var blue = Math.ceil(Math.random() * 255);
    $(this).css('background-color', "rgb("+red+","+green+","+blue+")")
  });
});


$('#trail').click(function(){
  makeGrid();
  $('.block').on("mouseover", function(){
    $(this).css("background-color", 'lightblue')
    $(this).css("opacity", '1');
    $(this).fadeTo(1000,0);
  });
});



});