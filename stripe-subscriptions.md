---
title: Stripe Subscriptions Example
---

<https://stripe.com/docs/billing/subscriptions/fixed-price#manage-payment-authentication>

- client sends server e-mail

- server creates customer

  ```javascript
  stripe.customer.create({ email })
  ```

- server sends client customer identifier

- client mounts Stripe element

- client creates payment method

  ```javascript
  stripe.createPaymentMethod({ type: 'card', card: element })
  ```

- client sends server:
  - customer identifier
  - payment method identifier
  - price identifier

- server attaches payment method to customer

  ```javascript
  stripe.paymentMethods.attach(paymentMethodID, { customer: customerID })
  ```

- server updates customer to use new payment method as default

  ```javascript
  stripe.customers.update(customerID, {
    invoice_settings: {
      default_payment_method: paymentMethodID
    }
  })
  ```

- server creates subscription

  ```javascript
  stripe.subscriptions.create({
    customer: customerID,
    items: [{ price: priceID }],
    expand: ['latest_invoice.payment_intent']
  })
  ```

- server checks payment intent status

  ```javascript
  subscription.latest_invoice.payment_intent.status: 'succeeded' || 'requires_action'
  ```

- server sends client the subscription record

- server monitors webhooks for `invoice.payment_succeeded`

- if payment_intent.status is `'requires_action'`, the client shows confirmation UI

  ```javascript
  stripe.confirmCardPayment(payment_intent.client_secret, { payment_method: paymentMethodID })
  ```
