class Env {
  Env._();
  static final Env _instance = Env._();
  factory Env() => _instance;

  late String baseUrl;

  void initEnv() {
    baseUrl = "https://itunes.apple.com";
  }
}
