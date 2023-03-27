eWeLink API for Dart (Flutter) is a package who let you interact directly with eWeLink API using your regular credentials.

This project is port from [Javascript eWelink API](https://ewelink-api.vercel.app/docs/introduction)

> :warning: This is a work in progress and not all features area available yet.
> Currently only login and toggle device are implemented.

## Usage

This package is a pure `Dart` package, and should work in any platform that Dart of Flutter supports.

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
import 'package:dart_ewelink_api/dart_ewelink_api.dart';

  //...

  const ewelink = Ewelink({
    email: '<your ewelink email>',
    password: '<your ewelink password>',
    region: '<your ewelink region>',
  });

  const Map<String, dynamic> devices = await ewelink.toggleDevice('deviceId');
```

## Additional information

Any help to develop other features will be welcomed. Feel free to contact me or PR.
