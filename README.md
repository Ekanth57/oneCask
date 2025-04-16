Flutter Test Task: My Collection App

Overview

This is a Flutter application that allows users to view their collection of bottles. The app includes the following features:

A collection screen displaying bottles with details.
A bottle detail screen with multiple tabs (Details, Tasting Notes, History).
A SignIn screen, where users can sign in to access the collection.
Offline support using mockup JSON data.
BLoC pattern for state management to manage the state of the bottles.


Features Implemented

1. My Collection Screen
Displays a list of bottles in a grid format.
Each item in the collection can be tapped to view more details on the Bottle Detail Screen.

2. Bottle Detail Screen
Displays details of a selected bottle, including tabs for:
Details: Information about the bottle.
Tasting Notes: Notes about the bottle’s taste.
History: Events related to the bottle.
The content of these sections is populated from mockup JSON data.

3. SignIn Screen
Allows users to sign in using hardcoded credentials.
After sign-in, users are redirected to the My Collection screen.
The app prevents back navigation once the user is signed in.

4. SignOut Flow
A dialog appears when users try to sign out, asking for confirmation.
After sign-out, users are redirected to the SignIn Screen, and back navigation is disabled.

5. Offline Data Handling
The app fetches mockup JSON data from a local asset and stores it in the app.
When the app is offline, it allows users to interact with the fetched data

6. State Management with BLoC
The app uses the BLoC pattern to manage the state of bottles.
State is managed and communicated between different widgets, ensuring the app responds to changes in data like loading, success, or error states.
Packages Used

1. flutter_bloc
Purpose: Used for state management with BLoC pattern.
Why: Flutter’s BLoC package allows us to handle state in a scalable and maintainable way. We used it to manage the state of fetching and displaying bottle data.

2. flutter_launcher_icons
Purpose: To generate app icons for both Android and iOS platforms.
Why: This package simplifies the process of setting up app icons for different screen sizes on both platforms. It automates the generation of various icon sizes needed for both platforms.

3. shared_preferences
Purpose: Used for storing and retrieving simple data (e.g., sign-in status).
Why: This package allows us to store key-value pairs in a simple way to handle user authentication state and app preferences.

4. flutter_svg
Purpose: To display SVG files in the app (for bottom navigation icons).
Why: SVG images are scalable and can be resized without losing quality, which is perfect for responsive design.
How to Run the Project

The app uses mockup data (in assets/data) for the bottles. During development, this data can be manually edited to test different scenarios.

