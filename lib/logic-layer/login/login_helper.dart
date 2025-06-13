//   // Logic for login
class LoginHelper {
  String login(String email, String password) {
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

    //validate email and password
    if (email.isEmpty) {
      return 'Email cannot be empty';
    } else if (!emailRegex.hasMatch(email)) {
      return 'Not a valid email';
    } else if (password.isEmpty) {
      return 'Password cannot be empty';
    } else if (password.length < 4) {
      return 'Password at least 4 characters';
    }

    //Data-Layer
    return 'Login successful';
  }
}
