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

    $('.results').on('click', '.follow', function (e) {

    });

    $('.results').on('click', '.unfollow', function (e) {

    });

    $('.results').on('click', '.nudge', function (e) {
      var handle = $(e.target).parents('.tweeter').data('handle');
      var nudgeModel = new tweetpaint.Models.Nudge({ handle: handle });
      var nudgeView = new tweetpaint.Views.Nudge({model: nudgeModel, el: $(e.target)});
    });

  });

}();