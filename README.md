# ApplyDigitalDemo

------------
> ApplyDigitalDemo is an app that show post from **Hacker News**. this application was created in **Swift** and also the interfaces were created with **SwiftUI** framework.

### Features

> Display a list of post of Hacker News.

> Tap on a post with an url shows an internal web view that load the link.

- **Architecture - MVVM + Clean:**
The MVVM architectural pattern facilitates the separation of the user interface code from the business logic code such that the view is not dependent upon any specific model platform, for the comunication MVVM make use of the observer pattern.

Clean Architecture proposes the use of separation by layers to make an scalable code, here we have presentation layer, domain layer and data layer.

- **Test Doubles:**

Test Double is a generic term for any case where you replace a production object for testing purposes. There are various kinds of double that Gerard lists:

**Dummy** objects are passed around but never actually used. Usually they are just used to fill parameter lists.

**Stubs** provide canned answers to calls made during the test, usually not responding at all to anything outside what's programmed in for the test.

**Spies** are stubs that also record some information based on how they were called. One form of this might be an email service that records how many messages it was sent.
**Mocks** are pre-programmed with expectations which form a specification of the calls they are expected to receive. They can throw an exception if they receive a call they don't expect and are checked during verification to ensure they got all the calls they were expecting.

for more information [Test Doubles](https://martinfowler.com/bliki/TestDouble.html "Test Doubles")


### Requirements

------------
- iOS 17.0+
- Xcode 15+
- Swift 5+

### Installation

------------
This is the installation process for ApplyDigitalDemo github repository.

```
git clone https://github.com/SergioHRV/ApplyDigitalDemo.git
```
> If building fails for the ADDemo.xcdatamodeld file, in xcode just delete the reference in ADDemo/Data/PersistentStorage and add the file reference again, it should be in the same folder
