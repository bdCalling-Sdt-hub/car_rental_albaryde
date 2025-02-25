import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart'; // For Ticker
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/utilities/app_strings.dart';
import 'package:untitled/views/base/custom_pin_code_field.dart';
import 'package:untitled/views/base/widgets/textUnderlne.dart';
import 'package:untitled/views/screens/reset_password.dart';

class VerifyMailScreen extends StatefulWidget {
  const VerifyMailScreen({super.key});

  @override
  State<VerifyMailScreen> createState() => _VerifyMailScreenState();
}

class _VerifyMailScreenState extends State<VerifyMailScreen>
    with TickerProviderStateMixin {
  late Ticker _ticker; // Ticker for countdown
  int _start = 10; // Timer starting value (seconds)
  bool _isButtonDisabled = true;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _forgotPasswordTEController =
        TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(32, 108, 32, 0).w,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppString.verifyEmail,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        AppTextUnderline(),
                      ],
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Center(
                    child: Text(
                      AppString.pleaseCheckYourEmailAndEnterTheCode,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  CustomPinCodeTextField(),
                  SizedBox(height: 32.h),
                  // Timer Text
                  Center(
                    child: Row(
                      spacing: 5.r,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.access_time_outlined),
                        Text(
                          _formatTime(_start),
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: OTP logic
                        // Get.to(VerifyEmailScreen());
                        Get.to(ResetPasswordPage());
                      },
                      child: Text(
                        AppString.verifyEmail,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Visibility(
                    visible: !_isButtonDisabled,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppString.didNotReceiveCode,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        TextButton(
                          onPressed: () {
                            _resetTimer(); // Reset and start the timer again
                            // TODO: Code resend logic

                          },
                          child: Text(
                            AppString.resendIt,
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Initialize the ticker and start the countdown
    _startTimer();
  }

  // Function to start the countdown timer
  void _startTimer() {
    _ticker = createTicker(_onTick)..start(); // Create and start the ticker
  }

  // Function that gets called on each tick
  void _onTick(Duration duration) {
    setState(() {
      _start = 10 - duration.inSeconds; // Update seconds remaining
      if (_start == 0) {
        _isButtonDisabled = false;
        _ticker.stop(canceled: true);
      }
    });
  }

  @override
  void dispose() {
    // Dispose of the ticker when the screen is disposed
    _ticker.dispose();
    super.dispose();
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _resetTimer() {
    // Reset the timer to initial state
    setState(() {
      _start = 10;
      _isButtonDisabled = true;
    });
    _ticker.stop(canceled: true); // Stop any previous ticker
    _ticker.dispose(); // Dispose the previous ticker
    _startTimer(); // Start a new ticker with reset timer
  }
}
