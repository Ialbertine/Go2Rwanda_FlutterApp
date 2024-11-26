# GO2RWANDA

GO2RWANDA is a mobile application designed to assist tourists and residents in exploring Rwanda's rich cultural heritage, natural wonders, and accommodations. The app provides a user-friendly interface for discovering attractions and navigating Rwanda's various points of interest. 

## Table of Contents

- [Features](#features)
- [Project Setup](#project-setup)
- [Usage](#usage)
- [Authentication](#Authentication)
- [Security](#Security)


## Features

- Explore attractions: Discover various cultural and natural sites in Rwanda.
- Navigation: Get directions and navigate to points of interest.
- User-friendly interface: Intuitive design for a seamless user experience.

## Project Setup

To set up the GO2RWANDA application on your local machine, follow these instructions:

### Prerequisites

Make sure you have the following installed:

- Flutter SDK (version 2.0 or higher)
- Dart SDK
- An IDE (e.g., Visual Studio Code, Android Studio)
- A physical device or emulator for testing

### Installation Steps

1. *Clone the Repository:*
     ==> git clone https://github.com/Ialbertine/Go2Rwanda_FlutterApp.git
   
To develop Go2Rwanda Mobile App we used SetState Management method that was used within stateful widgets to manage the state of this app’s user interface.

2. *Navigate to the project directory:*
  ==> cd GO2RWANDA
   
3. *Install depedencies:*
 ==> flutter pub get

5. *Run the app*
   ==>flutter run

## Usage 
 ## Login/Sign Up
 ==> Launch the app and register using email and password
 ==> Login with the credentials you just created
 ==> Select category based on the places you want to visit
 ==> Select the place based on you choices
 ==> Onlick to book button you will have a popup box dispaying more information about the place and their website
 ==> The user can search for places to visit using the map
 ==> The user can edit his/her profile
 ==> User can talk to us either by email or call

 ## Authentication 

 Go2RWANDA App uses Firebase Authentication to provide secure and reliable login system. We used firebase for google signin and  signup  and email password authentication.

 ## Security
 To ensure data is secure , GO2RWANDA uses firebase security rules for the firestore database and firebase authentication . These rules restrict access to authenticated users and provide role-based access to the app's resources.
 

