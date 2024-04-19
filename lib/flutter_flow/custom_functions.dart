import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

int? getItemIdIndex(
  List<String> list,
  int id,
) {
  String t = "$id";

  return list.indexOf(t);
}

String? getOrderStatus(int type) {
  List<String> Status = ["Pending", "En route", "Shipped", "Cancelled"];
  return Status[type];
}

String? getOrderStatusColor(int type) {
  var Status = ["#FFA500", "#0000ff", "#00ff00", "#ff0000"];
  return Status[type];
}

String? getNotificationMessage(int status) {
  String pending = "Your order is now pending review.";
  String enroute = "Your order is now en route.";
  String shipped = "Your order has been shipped.";
  String cancelled = "Your order has been cancelled.";
  var Messages = [pending, enroute, shipped, cancelled];

  return Messages[status];
}

double castToDouble(String num) {
  return double.parse(num);
}
