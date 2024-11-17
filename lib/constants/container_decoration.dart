import "package:flutter/material.dart";

BoxDecoration containerDecoration = BoxDecoration(
  color: Colors.white,
  border: Border.all(
    color: Colors.transparent,
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: const Offset(0, 3), // changes position of shadow
    ),
  ],
  borderRadius: BorderRadius.circular(20),
);
