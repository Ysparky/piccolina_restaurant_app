import 'dart:ui';

import 'package:dio/dio.dart';

const kPrimaryColor = Color(0xff053F5E);
const kSecondaryColor = Color(0xff107163);

final dioOptions = Options(
  validateStatus: (status) {
    return status < 500;
  },
);

const emailRegex =
    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";

const baseUrl = 'http://192.168.100.63:5001/api';
