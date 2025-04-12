import 'package:get/get.dart';

/// Base controller class that all controllers extend
class BaseController extends GetxController {
  final isLoading = false.obs;
  
  void startLoading() {
    isLoading.value = true;
  }
  
  void stopLoading() {
    isLoading.value = false;
  }
} 