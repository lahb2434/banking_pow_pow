# Banking Pow Pow 
An application that simulates an online banking experience, from logging in and setting up a checking account, applying for a credit card or getting a loan to purchase a house. Built with Ruby on Rails.

* Ruby version - ruby 2.6.1
* Rails version - 6.1.4

## Installation
Run `$ bundle install` from your shell.

### Database
Run `$ rails db:migrate` from shell to create database.

followed by `$ rails db:seed` from shell to create store elements.

### Facebook Authorization
To use Facebook Authorization run `rails credentials:edit` to create a config/credentials.yml.enc file and config/master.key file.

Navigate to [Facebook for Developers](https://developers.facebook.com/) and login or create an account.

Click on create app and follow prompts, go to basic section and scroll to bottom, in *Website* section enter server address, for example `http://localhost:3000/` in the input.

Return to dashboard and select Facebook Login, under Facebook Login select settings. Under Valid OAuth Redirect URIs input a callback url. Enter the server address followed by auth/facebook/callback for example `https://localhost:3000/auth/facebook/callback`

From your shell run `EDITOR=nano rails credentials:edit` or `EDITOR=vim` if you prefer to edit `credentials.yml`.
The editor should display:
```
# aws:
#   access_key_id: 123
#   secret_access_key: 345
<!-- Insert facebook, app id, and secret as shown -->
facebook:
  id: 828...
  secret: 3ac9...

# Used as the base secret for all MessageVerifiers in Rails, including the one protecting cookies.
secret_key_base: ...
```
Save and exit editor.

### Server
Run `rails server` to start server.

## Usage
Used to simulate a banking environement without using actual money or real world consequences. After login user can open a checking or savings account, request a debit card for checking account, and apply for a credit card. User can *deposit* money into checking account and transfer money between accounts. User can naviagate to store `http://localhost:3000/store` and purchase items with debit or credit card, or take out a personal loan.

Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

License
MIT