// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require('jquery')

import '../css/tailwind.css';

import twttr from "twitter-text";

$(function () {
  $('#tweetInput').keyup(function () {
    const twinput = $(this).val();
    const tweet = twttr.parseTweet(twinput);
    $('.show-remain').text(tweet.weightedLength / 2);
    if (tweet.valid) {
      $('#tweetWrap').removeClass("err");
      $("#tweetSubmit").prop('disabled', false);
    } else {
      $('#tweetWrap').addClass("err");
      $("#tweetSubmit").prop('disabled', true);
    }
  });
});

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
