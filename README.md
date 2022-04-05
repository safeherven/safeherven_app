# Safe Herven

Safe Herven is a mobile app for victims/survivors of sexual abuse, GBV, domestic abuse, harmful practices like FGM and child marriage as well as other traumatic events that can lead to anxiety and depression.
![image](https://user-images.githubusercontent.com/71177851/161199504-91c43872-1a80-439f-a831-1cfa188f1a58.png)


## Introduction 

Our motivation is the desire to provide a place where victims of gender-based violence can air out their minds in all safety and without being judged considering the fact that some victims do not have anyone in whom they can confide. Also, a lot of victims do not know where they can get the necessary help so we have provided a list of organisations whose goals are to help victims.

Download the app(.apk) [here](https://drive.google.com/file/d/15rkrBCESMkH1BCBhuALRlqTSCJWyWUyn/view?usp=sharing).

**Disclaimer:** The iOS version isn't available yet but it's coming soon.

## Key Features
- A friendly chat bot if you just need someone to talk to or want to know the next steps or what to do if faced with any of those mentioned issues.

- A map with common places you'll most likely need to go to and with just one tap, you find the closest place to you.

- A curated list of non-governmental organisations, foundations and frontline workers with their details. These NGOs are out to help such people but     sometimes they don't even know where to go to and which is legit.

![image](https://github.com/TatianaNsei/safeherven_app/blob/rm_update/assets/images/readme_images/safeherven1.png)

# How to build
Follow [this](https://docs.flutter.dev/get-started/install) on how to install and set up flutter for mobile development. Clone the repository: ``git clone https://github.com/safeherven/safeherven_app.git``

## Requirements

After cloning the repository, run ``flutter pub get`` to downloand all the dependencies.

## Steps to run
- Open android studio
- Get Google Maps API Key
- Add the API key to your flutter app in the application manifest (android/apps/src/main/AndroidManifest.xml), as follows: git clone 

```
<manifest ...
  <application ...
    <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="YOUR ANDROID API KEY HERE"/>
  ```   
- Also add your API key in `lib/services/places_service.dart`.
- Create a Firebase android app using the [Firebase Console](https://console.firebase.google.com/).
- Generate the `google-services.json` (on "Project settings" menu) and copy it to the `android/app` directory.
- Install the **Firebase CLI** [here](https://firebase.google.com/docs/cli).
- Run `dart pub global activate flutterfire_cli` in the project.
- Run `flutterfire configure`. This will start up a command line interface for you to select the Firebase project you want linked to your Flutter project. After it is complete, a `firebase_options.dart` file will be generated in your `lib` folder.
- Be sure to add your `client id` in `lib/screens/wrapper.dart`.
- Create a **DialogFlow agent** at the [Dialogflow Console](https://dialogflow.cloud.google.com/).
- Configure it to enable beta features as well as Auto Speech Adaptation.
- Go to your [Google Cloud Console](https://console.cloud.google.com/) and search for `Dialogflow API` in the top toolbar.
- Follow this [codelab](https://codelabs.developers.google.com/codelabs/dialogflow-flutter#1) at the **Google Cloud: Get a service account** section in order to get a service account.
- Once your `credentials.json` file is downloaded, add it to the root of the `assets` folder.
- From your `credentials.json` file, 
- Run the code on Android studio and view the app on an emulator of your choice or mobile device. You can also run the app from the terminal using: ``flutter run``

### TODOs
- Train the chatbot more to understand a wide variety of intents and make smarter responses.
- Add safe space forums where survivors/victims of similar trauma can communicate with each other.
- Add more NGOs to Firestore.
- Add feature for victims to report cases.
- Enable users to upvote and rank NGOs based on the number of upvotes.
- Add psychotherapists to the platform.


A Safe Haven for HER...


## Contributors
- Ida Delphine 
- Hawawou Oumarou
- Petra Ukeh Agien
- Tatiana Nsei 
