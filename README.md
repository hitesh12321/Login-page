## LOGIN AND SIGNUP BY FIREBASE AUTHENTICATION

### 1. Welcome to the App!

**What you see:** The app opens directly to a clean login screen. You see an app bar titled "Login Baby," two text fields for email and password, a "Login" button, and at the bottom, a prompt that says "Don't have an account?" followed by a "Signup" button.

**What's happening in the code:**
* Your `main.dart` file kicks things off by setting `LoginPage` as the home screen of the app.
* The `login_page.dart` file builds this UI. It uses a helper class from `UiHelper.dart` to create the text fields and button (`Uihelper.customTextField`, `Uihelper.CustomButton`). This is a great practice that keeps your UI code clean and reusable.
* Two `TextEditingController`s (`emailController` and `passwordController`) are ready to capture any text you type.

### 2. Time to Sign Up

**What you see:** You don't have an account yet, so you tap the "Signup" button. A new screen smoothly slides into view, presenting a similar layout but with three fields: Email, Password, and a field to confirm your password. There's a "SAVE" button at the bottom.

**What's happening in the code:**
* Back in `login_page.dart`, the `onPressed` function of the "Signup" `TextButton` is triggered.
* It executes `Navigator.push()`, which tells Flutter to add a new screen to the top of the navigation stack. The new screen is an instance of `Signuppage` from your `signUpPage.dart` file.

### 3. Creating Your Account

**What you see:** On the signup page, you can enter your new email and password into the fields.

**What's happening in the code:**
* The `Signuppage` widget, much like the login page, uses `TextEditingController`s to manage the input for the email, password, and confirmation fields.
* It also uses the same `Uihelper.customTextField` to ensure the text fields look consistent across both screens.

### 4. Saving Your Details

**What you see:** After filling in the details, you press the "SAVE" button. Nothing happens on the screen, but if you were watching the debug console, you'd see the message "hii" appear.

**What's happening in the code:**
* The `onPressed` function for the "SAVE" button in `signUpPage.dart` is called.
* Currently, this function is a placeholder that just prints a message (`print('hii');`). In a complete app, this is where you would add the logic to check if the passwords match and then save the new user's credentials to a database like Firebase.

### 5. Heading Back

**What you see:** You change your mind and tap the back arrow in the app bar of the signup page. You are taken smoothly back to the original login screen.

**What's happening in the code:**
* This is the default behavior of Flutter's `Navigator`. When you used `Navigator.push()` to show the `Signuppage`, it was placed on top of the `LoginPage`. The back button in the `AppBar` automatically calls `Navigator.pop()`, which removes the top screen (`Signuppage`) and reveals the one underneath (`LoginPage`).
