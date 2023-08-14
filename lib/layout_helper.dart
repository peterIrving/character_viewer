import 'package:flutter/material.dart';

bool isMobileLayout(BuildContext context) =>
    MediaQuery.of(context).size.shortestSide < 600;
