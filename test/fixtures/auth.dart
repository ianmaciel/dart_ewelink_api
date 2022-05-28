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

const fixtureCredentials = """
{ "at": "my_secret_at",
  "rt": "my_secret_rt",
  "user":
   { "clientInfo":
      { "model": "M2012K11AG_alioth",
        "os": "Android",
        "imei": "my_imei",
        "romVersion": "12",
        "appVersion": "4.22.1" },
     "_id": "my_id",
     "email": "myemailaddress@gmail.com",
     "password":
      "my_encrypted_password",
     "appId": "my_app_id",
     "isAccepEmailAd": false,
     "createdAt": "2019-09-17T22:18:31.036Z",
     "apikey": "45810a-my_api-key-abcd-7453453",
     "__v": 0,
     "lang": "en",
     "online": false,
     "onlineTime": "2022-05-28T15:44:15.826Z",
     "appInfos": [ { "os": "android", "appVersion": "4.22.1" } ],
     "ip": "206.10.93.226",
     "location": "",
     "offlineTime": "2022-05-28T15:46:56.031Z",
     "userStatus": "2",
     "bindInfos": { "gaction": [ "ewelink-google-home-v1", "ewelinkGoogleHome" ] },
     "countryCode": "+1",
     "currentFamilyId": "5f15eeFDFsfasadacd0ca8",
     "language": "en",
     "extraPush": { "Uw83Eacbde12345abcsdSdyjP7nTl": { "type": "fcm", "info": {  "token":
         "abcde-ABC:ABCDE_MYTOKEN_ATRUhy_yOUtpafm-MYTOKENMYTOKEN_XMYTOKEN-4MYTOKEN" } } },
     "extra": { "ipCountry": "US" },
     "accountInfo":
      { "level": 20,
        "validAt": "2021-10-20T00:00:10.354Z",
        "expiredAt": "2022-10-20T00:00:09.000Z" },
     "platformLang": { "webEwelink": "en" } },
  "region": "us" }
""";
