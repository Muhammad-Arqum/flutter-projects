import 'dart:io';

// User class representing a user with a username and password
class User {
  String username;
  String password;

  // Constructor to initialize a user with a username and password
  User(this.username, this.password);
}

// UserAuthentication class managing sign-up and sign-in operations
class UserAuthentication {
  // List to store user objects
  List<User> users = [];

  // Method for user sign-up
  bool signUp(String username, String password) {
    // Check if the username is already taken
    if (users.any((user) => user.username == username)) {
      print("Username '$username' is already taken. Please choose a different one.");
      return false;
    }

    // Create a new user and add to the list
    users.add(User(username, password));
    print("Sign-up successful for user '$username'.");
    return true;
  }

  // Method for user sign-in
  bool signIn(String username, String password) {
    // Check if the user exists and the password is correct
    var user = users.firstWhere(
      (user) => user.username == username && user.password == password,
      
    );

    // Display sign-in result
    if (user != null) {
      print("Sign-in successful for user '$username'.");
      return true;
    } else {
      print("Invalid username or password. Sign-in failed.");
      return false;
    }
  }
}

// Main function to run the user authentication console application
void main() {
  // Create an instance of UserAuthentication
  var userAuthentication = UserAuthentication();

  // Main loop for the user authentication menu
  while (true) {
    print("\nUser Authentication Menu:");
    print("1. Sign up");
    print("2. Sign in");
    print("3. Exit");

    // Get user input for menu choice
    var choice = input("Enter your choice (1-3): ");

    // Switch statement to handle menu choices
    switch (choice) {
      case "1":
        var username = input("Enter your username: ");
        var password = input("Enter your password: ");
        userAuthentication.signUp(username, password);
        break;
      case "2":
        var username = input("Enter your username: ");
        var password = input("Enter your password: ");
        userAuthentication.signIn(username, password);
        break;
      case "3":
        // Exit the program
        print("Exiting User Authentication. Thank you!");
        exit(0);
        // break;
      default:
        // Invalid choice message
        print("Invalid choice. Please enter a number between 1 and 3.");
        break;
    }
  }
}

// Function to get user input with a prompt
String input(String prompt) {
  stdout.write(prompt);
  return stdin.readLineSync()!;
}
