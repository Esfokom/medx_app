# MedX

MedX is a Flutter-based mobile application designed to help doctors track patient records across multiple hospitals. The app provides two distinct flows: a "Personal" flow for patients and a "Medical" flow for doctors, ensuring a seamless and secure experience for all users.

## Features

- **Account Management:**  
  - Doctors and patients can create new accounts and log in using Firebase Authentication.
  - SharedPreferences is utilized to store login status, allowing users to directly access the main screen after their first login.
  
- **User Profiles:**  
  - User details and profile pictures are stored securely in Firebase Firestore and Firebase Storage.
  
- **Medical Record Management:**  
  - Doctors can add and delete patient records, with data securely stored in Firebase Firestore.

## Tech Stack

- **Frontend:**  
  - Flutter
  
- **Backend:**  
  - Firebase Authentication
  - Firebase Firestore
  - Firebase Storage

## Installation

To run this project locally, follow these steps:

1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/MedX.git
    ```

2. Navigate to the project directory:
    ```bash
    cd MedX
    ```

3. Install dependencies:
    ```bash
    flutter pub get
    ```

4. Set up Firebase:
    - Follow the [official Firebase documentation](https://firebase.flutter.dev/docs/overview/) to connect your Flutter app with Firebase.
    - Make sure to add your `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) files to the appropriate directories.

5. Run the app:
    ```bash
    flutter run
    ```

## Project Structure

- **lib/**: Contains the main source code.
  - `main.dart`: Entry point of the application.
  - `screens/`: Contains the UI screens for both patient and doctor flows.
  - `services/`: Contains the service classes for Firebase authentication, Firestore, and Storage operations.
  - `models/`: Contains the data models used in the app.
  - `widgets/`: Contains reusable widgets.

## Screenshots

_Add screenshots of your app here._

## Contributing

Contributions are welcome! If you'd like to contribute, please fork the repository and use a feature branch. Pull requests are warmly welcome.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact

Elvis Owusu - [Email](esfokom@gmail.com)

Project Link: [https://github.com/Esfokom/MedX](https://github.com/Esfokom/MedX)
