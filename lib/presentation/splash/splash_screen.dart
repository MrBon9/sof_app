part of 'splash_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void changeScreen() {
    Future.delayed(const Duration(seconds: 1), () async {
      Navigator.pushReplacementNamed(
        context,
        RouteDefine.userListScreen.name,
      );
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                  height: 160.0,
                  width: 160.0,
                  child: Image.asset('assets/images/sof_logo.png')),
            )
          ],
        ),
      ),
    );
  }
}
