//= require jquery
//= require jquery_ujs
//= require_tree .


window.tweetpaint = window.tweetpaint || {}
tweetpaint.App = function () {

  $(document).ready(function () {
    $('#submit-search').on('click', function(e){
      e.preventDefault();
      var searchModel = new tweetpaint.Models.Search({q: 'darren criss', type: 'tweet'});
      var searchView = new tweetpaint.Views.Search({model: searchModel});
    });
  });

}();