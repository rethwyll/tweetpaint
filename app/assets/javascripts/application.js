//= require jquery
//= require jquery_ujs
//= require_tree .

tweetpaint.Models = {}
tweetpaint.Views = {}

tweetpaint.App = function () {

  $('#search').on('submit', function(){
    searchModel = new tweetpaint.Models.Search({q: $('#q').val(), type: 'tweet'});
    searchView = new tweetpaint.Views.Search({model: searchModel});
  });

}();
