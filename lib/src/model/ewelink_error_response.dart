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

import 'package:json_annotation/json_annotation.dart';

import 'ewelink_user.dart';

part 'ewelink_error_response.g.dart';

@JsonSerializable(explicitToJson: true)
// The api always returns status code 200, even when there are errors.
// If has erros, then the error will be inside the body.
class EwelinkErrorResponse {
  EwelinkErrorResponse({
    this.msg = '',
    this.errmsg = '',
    required this.code,
  });
  String msg;
  String errmsg;
  @JsonKey(name: 'error')
  int code;

  factory EwelinkErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$EwelinkErrorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$EwelinkErrorResponseToJson(this);

  static bool hasError(Map<String, dynamic> response) {
    int error = (response['error'] as int?) ?? 0;
    return (error != 0);
  }
}
