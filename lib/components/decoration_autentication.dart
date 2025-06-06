import 'package:flutter/material.dart';

InputDecoration getAuthenticationInputDecoration(String label){
  return InputDecoration(
    hintText: label,
    fillColor: Color.fromARGB(255, 184, 236, 250),
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(64)),
  );
}