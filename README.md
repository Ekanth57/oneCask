# One Cask App - Flutter Test Task

## Overview

**One Cask** is a Flutter-based mobile application that allows users to manage and view their collection of bottles. The app offers various features including browsing the collection, viewing detailed information for each bottle, signing in for a personalized experience, and handling offline data. It is built using the **BLoC pattern** for state management, ensuring the app's scalability and maintainability.

---

## Features Implemented

### 1. **My Collection Screen**
   - Displays a grid of bottles with essential details such as name, quantity, and image.
   - Users can tap on any bottle to view more detailed information on the **Bottle Detail Screen**.

### 2. **Bottle Detail Screen**
   - Displays detailed information about a selected bottle, including:
     - **Details**: Information like distillery, age, type, etc.
     - **Tasting Notes**: Descriptions of the bottle’s tasting experience.
     - **History**: Timeline of events related to the bottle.
   - The content is dynamically populated from mockup JSON data, ensuring seamless data presentation.

### 3. **SignIn Screen**
   - Users can sign in using hardcoded credentials.
   - Upon successful login, the user is redirected to the **My Collection** screen.
   - Once logged in, the app prevents users from navigating back to the SignIn screen.

### 4. **SignOut Flow**
   - Users can sign out via a **sign-out dialog**, with a confirmation prompt.
   - After signing out, the app redirects users to the **SignIn Screen** and disables back navigation to ensure a clean state.

### 5. **Offline Data Handling**
   - The app fetches mockup JSON data from a local asset (`assets/data` folder).
   - Even when the device is offline, the app allows users to view previously fetched data.
   - The app will refresh the data when the internet connection is restored.

### 6. **State Management with BLoC**
   - The app employs the **BLoC (Business Logic Component)** pattern for state management.
   - Using BLoC ensures that the state of the bottle data (loading, success, and error states) is efficiently managed and communicated across the app's UI components.

---

## Packages Used

### 1. **flutter_bloc**
   - **Purpose**: Used for state management with the BLoC pattern.
   - **Why**: The **flutter_bloc** package facilitates the separation of business logic from UI code, making it easier to manage states such as loading, success, and error across the app.

### 2. **flutter_launcher_icons**
   - **Purpose**: Generates app icons for both **Android** and **iOS** platforms.
   - **Why**: This package simplifies the process of creating and configuring the required icon sizes for different screen densities and devices on both platforms.

### 3. **shared_preferences**
   - **Purpose**: Stores and retrieves simple key-value data, such as the sign-in status.
   - **Why**: The **shared_preferences** package allows us to maintain user authentication state (whether a user is signed in or not) between app sessions.

### 4. **flutter_svg**
   - **Purpose**: To display **SVG** files in the app (used for bottom navigation icons).
   - **Why**: **SVG** images are scalable and don’t lose quality when resized, making them ideal for responsive design across multiple screen sizes and resolutions.

---
