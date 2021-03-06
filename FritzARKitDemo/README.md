# Fritz ARKit Examples

[![Twitter](https://img.shields.io/badge/twitter-@fritzlabs-blue.svg?style=flat)](http://twitter.com/fritzlabs)

In this app, we use [Object Detection API by Fritz](https://www.fritz.ai/features/object-detection.html?utm_source=github&utm_campaign=fritz-ios-tutorials) and [Pose Estimation API by Fritz](https://www.fritz.ai/features/pose-estimation.html?utm_source=github&utm_campaign=fritz-ios-tutorials) in order to build different ARKit experiences.

## Fritz AI

Fritz AI helps you teach your applications how to see, hear, feel, think, and sense. Create ML-powered features in your mobile apps for both Android and iOS. Start with our ready-to-use feature APIs or connect and deploy your own custom models.

## Requirements

- Xcode 10.2 or later.
- Xcode project targeting iOS 10 or above. You will only be able to use features in iOS 11+, but you still can include Fritz in apps that target iOS 10+ and selectively enable for users on 11+.
- Swift projects must use Swift 4.1 or later.
- CocoaPods 1.6.0 or later.

## Getting Started

**Step 1: Create a Fritz AI Account**

[Sign up](https://app.fritz.ai/register?utm_source=github&utm_campaign=fritz-ios-tutorials) for an account on Fritz AI in order to get started.

Make sure that you have added the `Fritz-Info.plist` file to the app.

**Step 2: Clone / Fork the fritz-ios-tutorials repository and open FritzStyleTransferDemo**

```
git clone https://github.com/fritzlabs/fritz-ios-tutorials.git
```

**Step 3: Setup the project via Cocoapods**

Install dependencies via Cocoapods by running `pod install` from `fritz-ios-tutorials/FritzARKitDemo`

```
cd fritz-ios-tutorials/FritzARKitDemo
pod repo update
pod install
```

**Step 4: Open up a new XCode project**

XCode > Open > FritzARKitDemo.xcworkspace

**Step 5: Run the app**

Attach a device or use an emulator to run the app. If you get the error "Please download the Fritz-Info.plist", you'll need to register the app with Fritz (See Step 2).

## For questions on how to use the demos, contact us:

- [Slack](https://fritz.ai/slack?utm_source=github&utm_campaign=fritz-ios-tutorials)
- [Help Center](https://docs.fritz.ai/help-center/index.html?utm_source=github&utm_campaign=fritz-ios-tutorials)

## Documentation

[Fritz Docs Home](https://docs.fritz.ai/?utm_source=github&utm_campaign=fritz-ios-tutorials)

[iOS SDK Reference Docs](https://docs.fritz.ai/iOS/latest/index.html?utm_source=github&utm_campaign=fritz-ios-tutorials)

## Join the community

[Heartbeat](https://heartbeat.fritz.ai/?utm_source=github&utm_campaign=fritz-ios-tutorials) is a community of developers interested in the intersection of mobile and machine learning. [Chat with us in Slack](https://fritz.ai/slack?utm_source=github&utm_campaign=fritz-ios-tutorials) and stay up to date on the latest mobile ML news with our [Newsletter](https://mobileml.us16.list-manage.com/subscribe?u=de53bead690affb8e9a21de8f&id=68acb5c0fd).

## Help

For any questions or issues, you can:

- Submit an issue on this repo
- Go to our [Help Center](https://docs.fritz.ai/help-center/index.html?utm_source=github&utm_campaign=fritz-ios-tutorials)
- Message us directly in [Slack](https://fritz.ai/slack?utm_source=github&utm_campaign=fritz-ios-tutorials)
