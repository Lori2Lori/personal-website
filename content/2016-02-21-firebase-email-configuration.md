---
title : Firebase email contact form configuration
date : 2016-02-21
description : Managing contact form on the website can be troublesome. Here I explain how I do it with Firebase
---

I just launched my new website http://lori2lori.com, where I offer my services as web developer. I needed [contact form](http://lori2lori.com/#contact). There are free solutions for connecting forms with email, like [Typeform](https://www.typeform.com/), [Contactus](http://contactus.com/), [Contactme](http://www.contactme.com/) (with payable pro versions).

Each of them have some limitations, so I've decided to create my own contact form that is suitable **for every website**, without much backend code.

As I'm using [Firebase](http://firebase.com/), Cloud based NoSQL database which provides real time syncing with all the clients subscribed to the server, to manage data in my other applications and I thought it may be just right for my contact form.

### 1. Create contact form
<img class="img-responsive" src="/images/contact-form.png" alt="Contact form png" >
```html
<form id="contact" action="/" method="POST">
  <textarea name="description"></textarea>
  <input type="email" name="email">
  <input type="text" name="company" >
  <button type="submit">Submit</button>
</form>
```

### 2. Connect form to Firebase
#### (written in CoffeeScript)

```coffeescript
Firebase   = require 'firebase'
database   = new Firebase 'link to database'

form.on 'submit', (event) =>
    do event.preventDefault
    form
      .find 'button'
      .prop 'disabled', yes

    inquiry = {}

    form
      .find 'input, textarea'
      .each (i, element) =>
        inquiry[element.name] = element.value

    database.push inquiry, (error) =>
      if error then return alert error
```

### 3. Write tests for Firebase security rules

```coffeescript
describe 'Firebase security rules', () ->
  @timeout 5000
  {
    secret
    url
  } = config.firebase

  it "doesn't allow unauthorised client to receive data", () ->
  # I expect not to receive data because of Firebase security rules
  new Promise (resolve, reject) ->
    db = new Firebase url
    callback = (snapshot) ->
      reject Error 'Data received. Unauthorised user should not have access to database.'
    cancelCallback = (error) ->
      expect error
        .to.have.property 'code'
        .equal 'PERMISSION_DENIED'
      do resolve

    db.once 'value', callback, cancelCallback
```

Other tests that may be useful:

```bash
it "doesn't allow unauthorised client to change existing data"
it "doesn't allow unauthorised client to delete existing data"
it "allows all users to write new data"
it "allows authorised client to receive data"
it "allows authorised client to change existing data"
```
### 4. Write security rules

It is extremely important to write `security rules` in Firebase dashboard, because as a default Firebase is open to every action (read and write).
Writing test before `security rules` make the process much easier.

```JSON
{
    "rules": {
        ".read": false,
        "$message": {
            ".write": "!data.exists()"
        }
    }
}
```

It doesn't allow to read any data except for authorised user. In Firebase, the 'secret' can be changed any time, but token is valid for a certain period of time and cannot be changed. That's why I prefer to use `secret`.

### 5. Create config file

First of all- remember to add config.cson file to .gitignore and don't send it to client.

```cson
nodemailer:
  service   : 'example-gmail',
  auth      :
    user      : 'user@example.com',
    pass      : '***********'

firebase  :
  url       : 'https://someexample.firebaseio.com/'
  secret    : 'copy&paste App secret from Firebase dashboard'

recipients: [
  'user@example.com'
  'anotheruser@example.com'
]
```

### 6. Create backend file

Although Firebase allows to get rid of database and most backend code, for security reasons there is sometimes a need to write a little bit of backend code.

For backend, I'm using [Node.js](https://nodejs.org) with [Nodemailer](https://github.com/nodemailer/nodemailer)

```coffeescript
nodemailer = require 'nodemailer'
Firebase   = require 'firebase'
config     = require 'config-object'

config.load '../config.cson', required: yes
database   = new Firebase config.firebase.url

database.authWithCustomToken config.firebase.secret, (error) ->
  if error then throw error

  transporter = nodemailer.createTransport config.nodemailer

  callback = (dataSnapshot) =>
    {
      company,
      email,
      description,
      processed
    } = dataSnapshot.val()
    return console.log {processed} if processed

    transporter.sendMail
      to: config.recipients
      subject: "New contact from #{company} (#{email})"
      replyTo: email
      text: description
      (error, info) =>
        if error then return console.error error
        Object.assign info, date: Date.now()
        console.log info
        dataSnapshot
          .ref()
          .child 'processed'
          .set info

  cancelCallback = (error) =>
    throw error

  database.on "child_added", callback, cancelCallback
```

The final result is [here](http://lori2lori.com/#contact).
