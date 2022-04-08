// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import sorting from "../utilities/sorting"
import password_check from "../utilities/password_check.js"
import form_inline from "../utilities/form_inline.js"
import progress_bar from "../utilities/progress_bar.js"
import timer from "../utilities/timer.js"

//=require jquery3
//=require popper
//=require bootstrap-sprockets
//=require_tree .


Rails.start()
Turbolinks.start()
ActiveStorage.start()
