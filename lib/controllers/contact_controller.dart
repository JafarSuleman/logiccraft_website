import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiccraft_website/controllers/base_controller.dart';

class ContactController extends BaseController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();
  
  final formKey = GlobalKey<FormState>();
  final RxBool isSubmitting = false.obs;
  final RxBool isSubmitSuccess = false.obs;
  final RxString errorMessage = ''.obs;
  
  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    subjectController.dispose();
    messageController.dispose();
    super.onClose();
  }
  
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }
  
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }
  
  String? validateMessage(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your message';
    }
    if (value.length < 10) {
      return 'Message should be at least 10 characters';
    }
    return null;
  }
  
  Future<void> submitForm() async {
    if (formKey.currentState!.validate()) {
      isSubmitting.value = true;
      errorMessage.value = '';
      
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      try {
        // In a real app, this would be an API call to submit the form
        // For now, we'll just simulate success
        isSubmitSuccess.value = true;
        resetForm();
      } catch (e) {
        errorMessage.value = 'Failed to submit form. Please try again later.';
        isSubmitSuccess.value = false;
      } finally {
        isSubmitting.value = false;
      }
    }
  }
  
  void resetForm() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    subjectController.clear();
    messageController.clear();
  }
} 