$('.registrations').ready(function() {
  $.externalScript('https://js.stripe.com/v1/').done(function(script, testStatus) {
    if (typeof Stripe != 'undefined') {
      console.log('Stripe Javascript file loaded.');
    }
    else 
    {
      console.log('Problem: Stripe JavaScript file not loaded.');
    }
    Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
    console.log('set  Stripe public key: ' + $('meta[name="stripe-key"]'));
    var subscription = {
      setupForm: function() {
        console.log('function: setupForm')
        return $('.card_form').submit(function() {
          console.log('setupForm: form submitted')
          $('input[type=submit]').prop('disabled', true);
          if ($('#card_number').length) {
            subscription.processCard(); 
            return false;
          } else {
            return true;
          }
        });
      }, 
      processCard: function() {
        console.log('function: processCard');
        var card;
        card = {
          name: $('#user_name').val(),
          number: $('#card_number').val(),
          cvc: $('#card_code').val(),
          expMonth: $('#card_month').val(),
          expYear: $('#card_year').val()
        };
        return Stripe.createToken(card, subscription.handleStripeResponse);
      },
      handleStripeResponse: function(status, response) {
        console.log('function: handleStripeResponse');
        if (status === 200) {
          //return alert('Stripe response: ' + response.id);
          $('#user_stripe_token').val(response.id)
          $('.card_form')[0].submit()
        } else {
          //return alert('Stripe response: ' + response.error.message);
          $('#stripe_error').text(response.error.message).show();
          return $('input[type=submit]').prop('disabled', false);
        } 
      }
    };
    return subscription.setupForm();
  });
});
