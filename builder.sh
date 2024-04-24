rm -rf build

# For iOS Device
xcodebuild archive \
-scheme test-processor \
-configuration Release \
-destination 'generic/platform=iOS' \
-archivePath './build/test-processor.framework-iphoneos.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# For Simulators
xcodebuild archive \
-scheme test-processor \
-configuration Release \
-destination 'generic/platform=iOS Simulator' \
-archivePath './build/test-processor.framework-iphonesimulator.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Create XCFramework
xcodebuild -create-xcframework \
 -framework './build/test-processor.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/test_processor.framework' \
-framework './build/test-processor.framework-iphoneos.xcarchive/Products/Library/Frameworks/test_processor.framework' \
-output './build/test_processor.xcframework'
