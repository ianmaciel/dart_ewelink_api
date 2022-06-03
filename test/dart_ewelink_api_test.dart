// MIT License
//
// Copyright (c) 2022 Ian Koerich Maciel
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import 'dart:convert';

import 'package:test/test.dart';

import 'package:dart_ewelink_api/dart_ewelink_api.dart';

import 'fixtures/auth.dart';

void main() {
  test('Model ewelink user', () {
    Map<String, dynamic> jsonFixture = jsonDecode(fixtureCredentials);
    EwelinkCredentials ewelinkCredentials =
        EwelinkCredentials.fromJson(jsonFixture);
    expect(ewelinkCredentials.at, 'my_secret_at');
    expect(ewelinkCredentials.rt, 'my_secret_rt');
    expect(ewelinkCredentials.region, 'us');
    expect(ewelinkCredentials.user.email, 'myemailaddress@gmail.com');
  });
}
