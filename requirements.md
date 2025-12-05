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








# Requirements for Creating a Header with Drawer Navigation

This document outlines the requirements for implementing a header widget with a navigation drawer in the Sandwich Shop Flutter application. The drawer will provide links to every page in the app for easy navigation.

---

## 1. UI Changes

### Header Widget
- Create a new reusable header widget (e.g., `AppHeader` or `MainHeader`).
- The header should include:
  - An AppBar with a menu (hamburger) icon on the left.
  - The app title or logo in the center or left.
  - Optionally, action icons (e.g., cart, search) on the right.

### Drawer
- The drawer should slide in from the left when the menu icon is tapped.
- The drawer should contain a `ListView` or `Column` of navigation links.
- Each link should navigate to a different page in the app.
- Each link should have a clear label (e.g., "Home", "Order", "Shopping Cart", "Login", "About", etc.).
- Optionally, include icons next to each link for clarity.

---

## 2. Navigation

- Use `Navigator.pushNamed(context, routeName)` for navigation.
- Ensure all app pages have named routes defined in `MaterialApp`.
- When a drawer link is tapped, close the drawer and navigate to the selected page.

---

## 3. Integration

- Replace the current AppBar in each page with the new header widget.
- Ensure the drawer is accessible from every main page of the app.

---

## 4. File Structure

- `lib/widgets/app_header.dart` — new file for the header and drawer widget.
- Update each main page (e.g., `main.dart`, `order_screen.dart`, etc.) to use the new header.

---

## 5. Accessibility & UX

- The drawer should be accessible via swipe and the menu icon.
- All links should be keyboard and screen-reader accessible.
- The currently active page can be highlighted in the drawer (optional).

---

## 6. Testing

- Add widget tests to verify:
  - The header and drawer appear on every page.
  - The drawer opens and closes correctly.
  - Each link navigates to the correct page.
  - The drawer closes after navigation.

---

## 7. Documentation

- Update the README to mention the new navigation drawer and its usage.

---

**Summary:**  
Implement a reusable header with a navigation drawer containing links to every page in the app. Ensure smooth navigation, accessibility, and integration across all main pages.