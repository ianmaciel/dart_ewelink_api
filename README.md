eWeLink API for Dart (Flutter) is a package who let you interact directly with eWeLink API using your regular credentials.

This project is port from [Javascript eWelink API](https://ewelink-api.vercel.app/docs/introduction)

> :warning: This is a work in progress and not all features area available yet.
> Currently only login, getDevices and toggleDevice methods are implemented.

## Usage

This package is a pure `Dart` package, and should work in any platform that Dart of Flutter supports.

```dart
import 'package:dart_ewelink_api/dart_ewelink_api.dart';

  //...

  const ewelink = Ewelink({
    email: '<your ewelink email>',
    password: '<your ewelink password>',
    region: '<your ewelink region>',
  });
  await ewelink.getCredentials();

  List<EwelinkDevice> devices = await ewelink.getDevices();
  await ewelink.toggleDevice(deviceId: devices.first.deviceid);
```

## Additional information

Any help to develop other features will be welcomed. Feel free to contact me or PR.
