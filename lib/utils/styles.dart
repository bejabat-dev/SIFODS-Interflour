import 'package:flutter/material.dart';

class Styles {
  AppBar customAppBar(BuildContext context, String title) {
    AppBar a = AppBar(
      title: Text(title),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
          )),
    );
    return a;
  }

  InputDecoration customInput(String label, Icon icon) {
    InputDecoration i = InputDecoration(
        contentPadding: const EdgeInsets.only(left: 12, right: 12),
        suffixIcon: icon,
        filled: true,
        fillColor: const Color.fromARGB(255, 240, 240, 240),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
        labelText: label);
    return i;
  }

  InputDecoration customFormDecoration(String? label) {
    InputDecoration i = InputDecoration(
        contentPadding: const EdgeInsets.only(left: 12, right: 12),
        filled: true,
        fillColor: const Color.fromARGB(255, 240, 240, 240),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
        labelText: label);
    return i;
  }

  InputDecoration dropdownDecoration(String? label, Icon? icon) {
    InputDecoration i = InputDecoration(
        iconColor: Colors.white,
        suffixIconColor: Colors.white,
        labelStyle: const TextStyle(color: Colors.black),
        contentPadding: const EdgeInsets.only(left: 8, right: 8),
        suffixIcon: icon,
        filled: true,
        fillColor: Colors.blue,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
        hintText: label,
        hintStyle: TextStyle(color: Colors.white));
    return i;
  }

  Text menuText(String text) {
    Text t = Text(
      text,
      style: const TextStyle(fontSize: 13),
    );
    return t;
  }

  Text buttonText(String text) {
    Text t = Text(
      text,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
    return t;
  }

  Text authText(String text) {
    Text t = Text(
      text,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
    return t;
  }

  Text coloredText(String text, Color color) {
    Text t = Text(
      text,
      style: TextStyle(color: color),
    );
    return t;
  }
}
