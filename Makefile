include build_version.mk
MAKEFLAGS += --always-make -j

buildAndroid:
	fvm flutter build appbundle --build-name $(BUILD_NAME) --build-number $(BUILD_NUMBER)
	git tag -f android$(BUILD_NAME)+$(BUILD_NUMBER) && git push --tags --force
	open ./build/app/outputs/bundle/release
# then: https://play.google.com/console/u/0/developers/9088834486078723199/app/4975293369460141426/releases/overview

buildIos:
	fvm flutter build ipa --build-name $(BUILD_NAME) --build-number $(BUILD_NUMBER)
	git tag -f ios$(BUILD_NAME)+$(BUILD_NUMBER) && git push --tags --force
	open ./build/ios/ipa
	open /Applications/Transporter.app
# then: https://appstoreconnect.apple.com/apps/1621996148/testflight/ios

buildAndroidIos: buildAndroid buildIos

generateLauncherIcons:
	fvm dart run flutter_launcher_icons -f launcher_and_splash/flutter_launcher_icons_1.yaml

generateSplashScreen:
	fvm dart run flutter_native_splash:create --path=launcher_and_splash/flutter_native_splash.yaml
