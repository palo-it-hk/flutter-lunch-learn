---
slug: /setup
sidebar_position: 2
---

# Setup

## Step 0: Knowledge Prerequisite

You should be comfortable coding in a modern high-level programming language, preferrably dart.
Read the [Dart Language Tour](https://dart.dev/guides/language/language-tour) for a quickstart.

The setup also requires you to have knowledge in using terminal.
Read this [well-written guide about terminal](https://towardsdatascience.com/a-quick-guide-to-using-command-line-terminal-96815b97b955) for a quickstart.

## Step 1: Install Flutter

Go to [Flutter Offical Install Guide](https://docs.flutter.dev/get-started/install), then:
- Choose your platform
- Follow [Get the Flutter SDK](https://docs.flutter.dev/get-started/install/macos#get-sdk).

:::note
Remember to [update your path permanantly](https://docs.flutter.dev/get-started/install/macos#update-your-path)
:::

At the end, you should run `flutter doctor` and see outputs.

## Step 2: Choose your emulator and install stuff

We need a device to test and develop our app. There are two choices:

1. **iOS (macOS only)**: Follow the [Flutter Offical iOS Setup Guide](https://docs.flutter.dev/get-started/install/macos#ios-setup)
  - Follow [Install XCode](https://docs.flutter.dev/get-started/install/macos#install-xcode)
  - Follow [Set up the iOS simulator](https://docs.flutter.dev/get-started/install/macos#set-up-the-ios-simulator)

2. **Android**: Follow the [Flutter Offical Android Setup Guide](https://docs.flutter.dev/get-started/install/macos#android-setup)
  - Follow [Install Android Studio](https://docs.flutter.dev/get-started/install/macos#install-android-studio)
  - Follow [Agree to Android Licenses](https://docs.flutter.dev/get-started/install/macos#agree-to-android-licenses)
  - Follow **EITHER** [Setup your Android device](https://docs.flutter.dev/get-started/install/macos#set-up-your-android-device) if your have an actual Android phone and want to use that for development
  
  OR
  - Follow [Setup the Android emulator](https://docs.flutter.dev/get-started/install/macos#set-up-the-android-emulator)

## Step 3: Choose and setup an editor

Follow [Flutter Offical Editor Guide](https://docs.flutter.dev/get-started/editor) to choose and setup and editor.

If you are unsure, choose VS Code.

## Step 4: Clone the project code

If you are familiar with git, go to [the project repository](https://github.com/palo-it-hk/flutter-lunch-learn) and clone the project.

If you are not familiar with git, you can [download the project zip file](https://github.com/palo-it-hk/flutter-lunch-learn/archive/refs/heads/master.zip) and unzip it in your desired empty folder.

## Step 5: Try to run the project

Open the project folder with your editor.

Then, follow the "Run the app" step in [this guide](https://docs.flutter.dev/get-started/test-drive?tab=androidstudio) for your desired editor.

**DO NOT** follow the "Create the app" step.


If everything has been done correctly, hopefully you will see the app running on your device like so:

![Initial Screen](/img/docs/initial-screen.png)