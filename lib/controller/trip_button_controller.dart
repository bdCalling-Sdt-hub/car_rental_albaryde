// ButtonController to manage button selection and API calling
import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../utilities/app_strings.dart';
import 'package:http/http.dart' as http;

class ButtonController extends GetxController {
  String selectedButton = AppString.pending; // Default selected button
  List<String> buttonList = [];
  dynamic content = '         ';

  // API URL (replace with your actual API endpoint)
  final String apiUrlsa =
      "https://jsonplaceholder.typicode.com/posts"; // Example API

  @override
  void onInit() {
    fetchContentForButton(AppString.pending, apiUrlsa);
    super.onInit();
  }

  // Fetch the button list (can be replaced with actual API logic)
  void fetchButtonList() {
    buttonList = [
      AppString.pending,
      AppString.inProgress,
      AppString.currentTrips,
      AppString.canceled,
      AppString.completed,
    ];
    update(); // Manually update the UI when the button list is fetched
  }

  // Update selected button and fetch the content based on the selected button
  void updateSelectedButton(String value) {
    selectedButton = value;
    fetchContentForButton(
      value,
      apiUrlsa,
    ); // Trigger API call based on selected button
    update(); // Manually update the UI
  }

  // Fetch content based on the selected button
  Future<void> fetchContentForButton(String button, String apiUrl) async {
    try {
      // Simulate an API call based on the selected button (API logic)
      final response = await http.get(Uri.parse(apiUrl)); // Actual API call

      if (response.statusCode == 200) {
        // Parse the response body
        final List data = json.decode(response.body);

        // Fetch content related to the selected button (simulated logic)
        content =
            "Content for $button:\n\n${data[0]['title']}"; // Example response usage
        update(); // Update UI with the new content
      } else {
        content = "Failed to load data from API.";
        update(); // Update UI with error message
      }
    } catch (e) {
      content = "Error: $e";
      update(); // Update UI with error message
    }
  }
}
