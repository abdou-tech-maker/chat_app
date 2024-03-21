# chat_task

This project is a chat application built with Flutter and Firebase Firestore. It demonstrates real-time messaging capabilities without the need for user authentication. Initial users and conversations are predefined in Firestore, allowing quick setup and testing of the app.

## Features

- Real-time messaging between users.
- Predefined users in Firebase Firestore for immediate use.
- Ability to create new chat conversations.
- Simple and intuitive UI.

## Access to firebase project is granted to : imed@attraxia.io

## Getting Started

To get this project up and running on your local machine, follow these steps.

### Prerequisites

- Flutter SDK Version 3.10.5
- Android Studio or Visual Studio Code
- Firebase project access

### Setup

1. **Clone the Repository**: Clone this repository to your local machine using `git clone [repository URL]`.

2. **Install Dependencies**: Navigate to the project directory in your terminal and run `flutter pub get` to install the required dependencies.

3. **Firebase Setup**:

   - Ensure you have access to the Firebase project. The project uses Firestore for storing chat data and user information.
   - Download the `google-services.json` and `GoogleService-Info.plist` files from the Firebase Console and place them in the appropriate directories (`android/app` for Android and the root of `ios` folder for iOS).

4. **Run the App**: Open the project in your IDE (Android Studio/VSCode) and run the app using the `flutter run` command.

## Usage

- **Initial Users**: The app comes with two initial users predefined in Firestore. You can use these users to test the messaging functionality without creating new accounts.
- **Creating a Chat**: To start a new chat, select the 'New Chat' option and then give it a title. You can then begin messaging in real-time.
- **Firestore Structure**: For details on the Firestore structure and how to add or modify initial users, refer to the Firestore Setup section below.

## Firestore Setup

This section describes the Firestore collection and document structure used in the app. It outlines how initial users are set up and how chat data is stored.

### Collections and Documents

- `users`: Collection where user information is stored.
  - Document fields: `uid`, `name`, `imageUrl` `isOnline`,`email`,`lastSeen`
- `chats`: Collection where chat conversations are stored.
  - Document fields: `chatId`, `participants`, `lastMessage`, `timestamp`,`messages`
- `messaages ` : subCollection in chat's collection which has info about messages
  - DocumentFields ; `recieverId`,`senderId`,`isMe`,`status`,`text`,`time`
