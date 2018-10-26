var commentForm = (function() {

  var DOM = {};
  //CACHE DOM
  function cacheDom() {
    DOM.$ticketId = document.getElementById('ticketId').value;
    DOM.$form = document.getElementById('commentForm');
    DOM.$submitButton = document.getElementById('submitButton');
    DOM.$spanMessage = document.getElementById('spanErrorMessage');
    DOM.$commentText = document.getElementById('commentText');
  }

  //BIND EVENTS
  function bindEvents() {
    DOM.$submitButton.addEventListener("click", validateForm);
  }

  //FUNCTIONS
  function validateForm(e) {
    e.preventDefault();
    if (DOM.$commentText.value == "") {
      showErrorMessage();
    } else {
      removeErrorMessage();
      submitForm();
    }
  }

  function showErrorMessage() {
    DOM.$spanMessage.innerHTML = "Digite algo no comentário";
    DOM.$spanMessage.style.display = "block";
  }

  function removeErrorMessage() {
    DOM.$spanMessage.text = "";
    DOM.$spanMessage.style.display = "none";
  }

  function submitForm() {
    Rails.ajax({
      url: "/comments",
      type: "POST",
      data: "text=" + DOM.$commentText.value + "&" + "ticket_id=" + DOM.$ticketId,
      success: function(data) {
        console.log(data);
      }
    });
  }

  //INIT ONLOAD
  function init() {
    document.addEventListener('DOMContentLoaded', function() {
      if (document.getElementById('commentForm')) {
        cacheDom();
        bindEvents();
      }
    }, false);
  }

  init();
})();
