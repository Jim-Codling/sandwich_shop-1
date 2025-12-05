# Requirements for Adding a Login Page

This document describes the steps and requirements for adding a new "Login" page to the Sandwich Shop Flutter application. The login page will be accessible from the home screen via a button. When pressed, the user will be taken to a new screen with two textboxes (email and password) and a login button.

---

## 1. UI Changes

### Home Screen
- Add a new button labeled "Login" to the home screen (`OrderScreen`).
- The button should be clearly visible and accessible, ideally placed near other navigation or action buttons.

### Login Page
- Create a new Dart file, e.g., `login_page.dart`, for the login screen.
- The login page should contain:
  - A `TextField` for the user to enter their email.
  - A `TextField` for the user to enter their password (obscured).
  - A button labeled "Log In" below the text fields.
- The layout should be user-friendly and responsive.

---

## 2. Navigation

- Define a new route for the login page in the `MaterialApp` routes map (e.g., `'/login'`).
- When the "Login" button on the home screen is pressed, use `Navigator.pushNamed(context, '/login')` to navigate to the login page.

---

## 3. State Management

- The login page should manage the state of the email and password text fields.
- Optionally, display error messages if the fields are empty or invalid when the user presses "Log In".

---

## 4. Validation (Optional)

- Add basic validation for the email format and non-empty password.
- Show a message if validation fails.

---

## 5. Authentication Logic (Optional/Future)

- For now, pressing "Log In" can simply print the entered credentials or show a success message.
- In the future, integrate with a backend or authentication service.

---

## 6. File Structure

- `lib/login_page.dart` — new file for the login page widget.
- Update `lib/main.dart`:
  - Add the route for the login page.
  - Add the "Login" button to the home screen.

---

## 7. Example UI Flow

1. User opens the app and sees the home screen.
2. User presses the "Login" button.
3. App navigates to the login page.
4. User enters email and password.
5. User presses "Log In".
6. App validates input and shows a message (success or error).

---

## 8. Testing

- Add widget tests to verify:
  - The "Login" button appears on the home screen.
  - Navigation to the login page works.
  - The login page displays both text fields and the button.
  - Validation and feedback work as expected.

---

## 9. Accessibility & UX

- Ensure text fields are labeled.
- Password field should obscure input.
- Button should be accessible via keyboard and screen readers.

---

## 10. Documentation

- Update the README to mention the new login feature and usage instructions.

---

**Summary:**  
Implement a new login page with email and password fields, accessible from the home screen via a button, with navigation, basic validation, and clear UI/UX.