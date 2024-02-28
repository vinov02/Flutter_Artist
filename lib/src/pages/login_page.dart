import 'package:artist_community/src/components/g_nav.dart';
import 'package:artist_community/src/pages/forgot_password.dart';
import 'package:artist_community/src/pages/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // Dispose of the controllers when the widget is removed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn(context) async {
    try {
      setState(() {
        _isLoading = true; // Set loading state to true when sign-in starts
      });

      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      print('Successfully logged in: ${userCredential.user?.email}');

      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
      // Navigate to the home page or perform other actions on successful login

    } on FirebaseAuthException catch (e) {
      print('Failed to log in: ${e.message}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed: ${e.message}'),
          backgroundColor: Colors.red,
        ),
      );
    }
    finally {
      setState(() {
        _isLoading = false; // Set loading state to false after sign-in completes
      });
    }
  }
  Future<void> _handleGoogleSignIn() async {
    try {
      setState(() {
        _isLoading = false;
      });

      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);

      print('Successfully logged in with Google: ${userCredential.user?.displayName}');

      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
    } catch (error) {
      print('Error signing in with Google: $error');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
  Future<void> _handleSignOut() async {
    await _auth.signOut(); // Sign out from Firebase
    await _googleSignIn.signOut(); // Sign out from Google Sign-In
  }


  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 157),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Welcome Back",
                  style: TextStyle(

                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 7),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "sign in to continue",
                  style: TextStyle(

                    fontSize: 13,
                    color: Color(0xFF6078EA),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Enter Email',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6078EA)),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                  labelStyle: const TextStyle(color: Colors.black),
                  border: const OutlineInputBorder(),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6078EA)),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
                obscureText: !_isPasswordVisible,
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const ForgotPasswordPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: const Color(0xFFF54EA2),
                  fixedSize: const Size(180.0, 50.0),
                ),
                onPressed: () {
                  _signIn(context);
                  // Clear text fields
                  _emailController.clear();
                  _passwordController.clear();
                  _handleSignOut();
                },
                child: _isLoading
                    ? const CircularProgressIndicator(
                  color: Colors.white,
                ) // Show progress indicator when loading
                    : const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Continue',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                     Icon(
                      Icons.arrow_forward,
                      size: 17,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  '  Or Login With',
                  style: TextStyle(

                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20),
          ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: const Color(0xFFF54EA2),
            fixedSize: const Size(180.0, 50.0),
          ),
          onPressed: _handleGoogleSignIn,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImageIcon(
                AssetImage('assets/icons8.png'),
              ),
              Text(
                '  Google',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Create a new account',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF6078EA),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 1),
            ],
          ),
        ),
      ),
    );
  }
}
