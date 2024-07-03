const serverUrl = "https://genericartmedicine.com/api_ecom";

enum Flavour { development, production }

extension StringX on String {
  Flavour get flavourByString {
    return Flavour.values.firstWhere((flavour) => flavour.toString() == this);
  }
}

abstract class EnvironmentBase {
  final Flavour flavour;
  final String serverURL; // Add this field

  EnvironmentBase(this.flavour, this.serverURL);

  String get flavourName => flavour.toString();
}

abstract class Environment extends EnvironmentBase with ApiMixin {
  Environment(Flavour flavour, String serverURL) : super(flavour, serverURL);

  static Environment? _instance;

  static Environment get instance =>
      _instance ??
      (throw Exception(
          "You need to call `Environment.initialize` before accessing the getter function"));

  factory Environment.initialize({Flavour? flavour, String? serverURL}) {
    flavour ??=
        const String.fromEnvironment("flavor", defaultValue: "production")
            .flavourByString;

    return _instance ??= _getInstanceByFlavour(flavour, serverURL);
  }

  static Environment _getInstanceByFlavour(Flavour flavour, String? serverURL) {
    switch (flavour) {
      case Flavour.development:
        return _Dev(flavour, serverURL ?? "");
      case Flavour.production:
        return _Prod(flavour, serverURL ?? "");
    }
  }
}

class _Dev extends Environment {
  _Dev(Flavour flavour, String serverURL) : super(flavour, serverURL);

  @override
  String get baseUrl => serverURL;

  @override
  String get customerLoginBaseUrl => "${baseUrl}/customer_login";

  @override
  // TODO: implement loginBaseUrl
  String get loginBaseUrl => throw UnimplementedError();
}

class _Prod extends Environment {
  _Prod(Flavour flavour, String serverURL) : super(flavour, serverURL);

  @override
  String get baseUrl => serverURL;

  @override
  // TODO: implement loginBaseUrl
  String get loginBaseUrl => "${baseUrl}/login";
}

mixin ApiMixin {
  String get baseUrl;
  String get loginBaseUrl;
}
