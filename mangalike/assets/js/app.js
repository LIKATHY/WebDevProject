// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"
import he from "he"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

 import socket from "./socket"

// import socket from "./socket"

let handlebars = require("handlebars");


$(function() {
  if (!$("#reviews-template").length > 0) {
  	console.log('not running on this page')
    return;
  }
  console.log('running')

  let tt = $($("#reviews-template")[0]);
  let code = tt.html();
  let tmpl = handlebars.compile(code);

  let dd = $($("#serie-reviews")[0]);
  let path = dd.data('path');
  let p_id = dd.data('serie_id');
  let s_id = $('#mangaTitleId').text()

  let ReviewButton = $($("#review-add-button")[0]);
  let u_id = ReviewButton.data('review-add-button');
  let user_id = ReviewButton.data('user-id');
  console.log(user_id);
  let thisComment = '';

  let arrayreviews;
  let data_map;

  function fetch_reviews() {
    function got_reviews(data) {
      console.log(data);

      let thisPageReviews = []
      for (var i = data.data.length - 1; i >= 0; i--) {
      	let review = data.data[i];
      	if (data.data[i].serie_id ==  $('#mangaTitleId').text()) {
      		thisPageReviews.push(data.data[i])
      	}
      }

      let outer = $('#thinfdsadsfjl')
      outer.empty()

      for (var i = thisPageReviews.length - 1; i >= 0; i--) {
      	let commentAndUserId;
      	try {
      	commentAndUserId = JSON.parse(thisPageReviews[i].comment)
      }
      catch (e) {
      	continue;
      }

      let toadd = $('<a href="/users/' + commentAndUserId.user_id + '"> View Profile of '+commentAndUserId.username+' </a>' +
      '<div class="card w-75 m-2"> ' +
      '<div class="card-body">' +
        '<h6 class=""></h6>' +
        '<div class="card-text">' +
          '<p>' + commentAndUserId.comment + '</p>' +
        '</div>' +
      '</div>' +
    '</div>')


      outer.append(toadd)

      }
    }

    $.ajax({
      url: '/reviews',
      data: {serie_id: s_id},
      contentType: "application/json",
      dataType: "json",
      method: "GET",
      success: got_reviews,
    });
  }

  function add_review() {


  	// get the value of the text box

  	let value  =$('#review-comment').val()
  	console.log(value)


    let data = {review: {serie_id: s_id, user_id: user_id, rating: 3, comment: JSON.stringify({
    	user_id: user_id,
    	comment: value,
    	username: $('.text').text().trim()
    })}};
    
    // mix phx.gen.json Feedback Review reviews rating:integer comment:text serie_id:string user_id:references:users

    console.log('adding review')
    $.ajax({
      url: '/reviews',
      data: JSON.stringify(data),
      contentType: "application/json",
      dataType: "json",
      method: "POST",
      success: fetch_reviews,
    });

  }

  function remove_review() {

  	var u_email_id = data_map[window.user_email].id;

    $.ajax({
      url: path + '/' + u_email_id, 
      contentType: "application/json",
      dataType: "json",
      method: "DELETE",
      success: fetch_reviews,
    });

  }


  function button_clicked() {

	// var this_user_reviewed = data_map[window.user_email]

	// if (this_user_reviewed) {
		// unlike here
		// remove_review()
		// $('#review-add-button').html('Write Review!')
	// }
	// else {
		add_review();
	// 	$('#review-add-button').html('Delete Review')

	// }	
  }

  ReviewButton.click(button_clicked);

  fetch_reviews();

});


function updateMangaTitleId() {
	let ele = $('#mangaTitleId')
	if (ele) {
		let output = he.decode(ele.text())
		console.log(output)
		ele.text(output)
	}
 	
 	ele = $('#mangaSummaryId')
 	if (ele) {
 		let output = he.decode(ele.text())
 		console.log(output)
 		ele.text(output)
 	}
 }

 
 $(updateMangaTitleId)
