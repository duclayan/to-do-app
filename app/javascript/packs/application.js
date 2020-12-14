// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// show_all_task = document.getElementById('show-all-task').addEventListener('click', show_all())
// urgent_task = document.getElementById('urgent.task').addEventListener('click', show_urgent())

// function show_all() {

// }

// function show_urgent() {
//     document.getElementById('table-contents').insertAdjacentHTML("beforebegin", "<% if Day.today === entry.deadline %>")
//     document.getElementById('table-contents').insertAdjacentHTML("afterend", "<% end %>")

// }


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)