# ScreenshotTestingDemo

A demo PoC for usage of screenshot testing as a regression QA tool

## The proof of concept

In the master branch, we have a simple ViewController with a fake login screen. This screen has been recorded by iOSSnapshotTestCase on the following path

<img src="/ScreenshotTestingDemoTests/ReferenceImages_64/ScreenshotTestingDemoTests.ScreenshotTestingDemoTests/testExample%402x.png" width="180"/>

In [PR #3](https://github.com/Ferdzz/ScreenshotTestingDemo/pull/3), we have a CI failure. This is caused by iOSSnapshotTestCase detecting a change in the new screenshot. This is done on purpose to showcase the screenshot testing feature. The only way to make the CI pass at this point is to either fix the change, or re-record this screen and commit the new screenshot file. 

## Validating on development machines

When running the unit tests in the failure branch, iOSSnapshotTestCase generates an image file with the visual diff between the two:

<img src="https://user-images.githubusercontent.com/7923672/156423594-4df37e41-e458-4a51-9bb1-601b1919a866.png" width="180"/>

The medium gray background indicates no change between the versions. Notice the gray line towards the upper middle part of the screenshot. This is where the library detected changes. This indicates to us that there is a problem with the password field. It's width has changed.

The reference, failed and diff images are saved in the `FailureDiffs` folder. These shouldn't be commited to the repo as they are debugging tools for developers and serve no purpose on the CI.

## About the library

iOSSnapshotTestCase works by comparing a unit test screenshot to a reference image stored in the repo. 

To setup a new screenshot testing case:
1. Create a unit test file that inherits from `FBSnapshotTestCase`. This unit test should be able to create and load the view to test
2. To enable recording of new screenshots, we need to set `self.recordMode` to true in the `setUp` method
3. In the unit test, validate the view by calling `FBSnapshotVerifyView`
4. Run the test so that the reference screenshot is generated and saved
5. Set `self.recordMode` to false before pushing

See [iOSSnapshotTestCase](https://github.com/uber/ios-snapshot-test-case) for more details on usage
