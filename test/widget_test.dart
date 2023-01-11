import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nymble_interview/main.dart';

import 'package:nymble_interview/screens/WelcomeScreen/welcome_view.dart';

void ignoreOverflowErrors(
    FlutterErrorDetails details, {
      bool forceReport = false,
    }) {
  bool ifIsOverflowError = false;
  bool isUnableToLoadAsset = false;

  // Detect overflow error.
  var exception = details.exception;
  if (exception is FlutterError) {
    ifIsOverflowError = !exception.diagnostics.any(
          (e) => e.value.toString().startsWith("A RenderFlex overflowed by"),
    );
    isUnableToLoadAsset = !exception.diagnostics.any(
          (e) => e.value.toString().startsWith("Unable to load asset"),
    );
  }

  // Ignore if is overflow error.
  if (ifIsOverflowError || isUnableToLoadAsset) {
    debugPrint('Ignored Error');
  } else {
    FlutterError.dumpErrorToConsole(details, forceReport: forceReport);
  }
}


void main() {

  TestWidgetsFlutterBinding.ensureInitialized();


  testWidgets("welcome screen next button test", (WidgetTester tester) async {
    FlutterError.onError = ignoreOverflowErrors;

    await tester.pumpWidget(const PetAdopApp());
    expect(find.text("Welcome to Pet \nAdop"), findsOneWidget);
    await tester.tap(find.byKey(const Key('welcome_button')));
    await tester.pump();
    expect(find.text("Welcome to Pet \nAdop"), findsNothing);
  });
}
