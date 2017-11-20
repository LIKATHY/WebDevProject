// Attribute to Prof Nathaniel Tuck's class notes and code
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

// import socket from "./socket"

// let handlebars = require("handlebars");

// $(function() {
//   if (!$("#reviews-template").length > 0) {
//     // Wrong page.
//     return;
//   }

//   let tt = $($("#reviews-template")[0]);
//   let code = tt.html();
//   let tmpl = handlebars.compile(code);

//   let dd = $($("#serie-reviews")[0]);
//   let path = dd.data('path');
//   let p_id = dd.data('serie_id');

//   let bb = $($("#review-add-button")[0]);
//   let u_id = bb.data('user-id');

//   function fetch_reviews() {
//     function got_reviews(data) {
//       console.log(data);
//       let html = tmpl(data);
//       dd.html(html);
//     }

//     $.ajax({
//       url: path,
//       data: {serie_id: p_id},
//       contentType: "application/json",
//       dataType: "json",
//       method: "GET",
//       success: got_reviews,
//     });
//   }

//   function add_review() {
//     let comment = $("#review-comment").val();

//     let data = {review: {serie_id: p_id, user_id: u_id, rating: 3, comment: comment}};

//     $.ajax({
//       url: path,
//       data: JSON.stringify(data),
//       contentType: "application/json",
//       dataType: "json",
//       method: "POST",
//       success: fetch_reviews,
//     });

//     $("#review-comment").val("");
//   }

//   bb.click(add_review);

//   fetch_reviews();
// });



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