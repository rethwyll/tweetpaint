//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
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
      var handle = $(e.target).parents('.tweeter').data('handle');
      var followQueue = sessionStorage.getItem('followQueue'); 
      var a = (typeof followQueue === 'string') ? followQueue.split(',') : [];
      a.push(handle);
      sessionStorage.setItem('followQueue', a.join(',')); 
      $(e.target).removeClass('btn-warning').addClass('btn-success').text('Added to Follow Queue!')
    });

    $('.results').on('click', '.unfollow', function (e) {
      var handle = $(e.target).parents('.tweeter').data('handle');
      var unfollowQueue = sessionStorage.getItem('unfollowQueue'); 
      var a = (typeof unfollowQueue === 'string') ? unfollowQueue.split(',') : [];
      a.push(handle);
      sessionStorage.setItem('unfollowQueue', a.join(',')); 
      $(e.target).removeClass('btn-warning').addClass('btn-success').text('Added to Unfollow Queue!')
    });

    $('.results').on('click', '.nudge', function (e) {
      var handle = $(e.target).parents('.tweeter').data('handle');
      var nudgeModel = new tweetpaint.Models.Nudge({ handle: handle });
      var nudgeView = new tweetpaint.Views.Nudge({model: nudgeModel, el: $(e.target)});
    });

  });
}();