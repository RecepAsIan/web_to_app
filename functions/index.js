const functions = require('firebase-functions');
const admin = require('firebase-admin');
const stripe = require('stripe')('sk_test_51Oj2ACHfEi3wiRHlZJymjAAwL74PUpHB4trtHJLHwqDpirZiwMdVCSSH4tLz27slc5WzZbj9MdCJ8IzBrpBepRJT00TReO3qbu'); // Stripe API key

admin.initializeApp();

exports.processPayment = functions.https.onCall(async (data, context) => {
    try {
        // Check if user is authenticated
        if (!context.auth) {
            throw new functions.https.HttpsError('unauthenticated', 'User must be authenticated.');
        }

        const { amount, cardToken } = data;
        const uid = context.auth.uid;

        // Create a payment intent with Stripe
        const paymentIntent = await stripe.paymentIntents.create({
            amount: amount,
            currency: 'usd', // Change to your desired currency
            payment_method: cardToken,
            confirm: true,
        });

        // Handle successful payment
        if (paymentIntent.status === 'succeeded') {
            // Save payment details to Firestore
            const paymentDocRef = admin.firestore().collection('users').doc(uid).collection('payments').doc();
            await paymentDocRef.set({
                amount: amount,
                userEmail: context.auth.token.email,
                timestamp: admin.firestore.FieldValue.serverTimestamp(),
            });

            return { success: true };
        } else {
            throw new functions.https.HttpsError('unknown', 'Payment failed. Please check your card details.');
        }
    } catch (error) {
        throw new functions.https.HttpsError('internal', 'An error occurred while processing payment.', error);
    }
});


const functions1 = require('firebase-functions');
const strip = require('stripe')('sk_test_51Oj2ACHfEi3wiRHlZJymjAAwL74PUpHB4trtHJLHwqDpirZiwMdVCSSH4tLz27slc5WzZbj9MdCJ8IzBrpBepRJT00TReO3qbu');

exports.createStripeToken = functions1.https.onCall(async (data, context) => {
    const token = await strip.tokens.create({
        card: {
            number: data.number,
            exp_month: data.exp_month,
            exp_year: data.exp_year,
            cvc: data.cvc,
        },
    });
    return token.id;
});
