//= require jquery
//= require jquery_ujs
//= require mustache
//= require_tree .


window.tweetpaint = window.tweetpaint || {}
tweetpaint.App = function () {
  $(document).ready(function () {
    $('#submit-search').on('click', function(e){
      e.preventDefault();
      var searchModel = new tweetpaint.Models.Search({q: $('#q').val(), type: 'tweet'});
      var searchView = new tweetpaint.Views.Search({model: searchModel});
    });

    if ($('#following-results').length){
      var followingModel = new tweetpaint.Models.Following();
      var followingView = new tweetpaint.Views.Following({model: followingModel});
    }

  });

}();