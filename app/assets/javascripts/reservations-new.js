/*
https://coolors.co/app/011627-fdfffc-2ec4b6-e71d36-ff9f1c

*/

$(document).ready(function() {
  // init Isotope
  var $grid = $('#rooms-container').isotope({
    // options
    itemSelector: '.rc',
    layoutMode: 'fitRows'
  });

  // bind filter click
  $('#room-types-container').on('click', '.rc', function() {
    var filterValue = $(this).attr('data-filter');

    $grid.isotope({
      filter: filterValue
    });
    $("#rooms-container .rc" + filterValue + ":first").click();
  });
  $('#room-types-container .rc').click(function() {
    $(this).addClass('is-selected');
    $(this).siblings().removeClass('is-selected');
  });

  // Change is-selected for grid-item
  $('#rooms-container .rc').click(function() {
    $(this).addClass('is-selected');
    $(this).siblings().removeClass('is-selected');
    //$(this).children("input[name='reservation[room_id]']:radio").eq(0).prop('checked', true);
    rd = $(this).find("input[type='radio']")[0];
    rd.checked = true;
    
    $('input').iCheck('update');
    
    /*var price = $(this).children("input[name='reservation[room_id]']:radio").eq(0).data('room-price');*/
    var price = rd.dataset.roomPrice;
   
    // Convert price from string to float
    price = parseFloat(price);
    var tax_rate = 10.0;    
    var tax = (tax_rate/100) * price;    
    var total = price + tax;
    
    // Set the values
    price = numeral(price).format('$0,0.00');
    $("#room-price").val(price);
    tax = numeral(tax).format('$0,0.00');
    $("#tax").val(tax);
    total = numeral(total).format('$0,0.00');
    $("#total-room-price").val(total);
  });
});