function PledgedItemsView() {};

PledgedItemsView.prototype = {
  render: function(itemList) {

    $('.pledged-list').empty();

    for(var i=0; i < itemList.length; i++) {
      var newItemFormat = '<div class="pledgeitem-div">';
      newItemFormat += '<div class="pledge-name">';
      newItemFormat += itemList[i].description;
      newItemFormat += '</div>';
      newItemFormat += '<div class="pledge-qty">';
      newItemFormat += '</div></div>';
      console.log(newItemFormat);
      $('.pledged-list').append(newItemFormat);
    }

  }
}
