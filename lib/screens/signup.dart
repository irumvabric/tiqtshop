import 'package:flutter/material.dart';
import 'package:tiqtshop/backend/auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  String? _selectedValue;
  final List<String> _items = ['female','male'];

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _obscureText = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//             colors: [Colors.blue[100]!, Colors.blue[400]!],
//           ),
//         ),
//         child: SafeArea(
//           child: Center(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(30.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Icon(
//                       Icons.lock,
//                       size: 100,
//                       color: Colors.white,
//                     ),
//                     const SizedBox(height: 30),
//                     Text(
//                       'Welcome Back',
//                       // style: Theme.of(context).textTheme.headline4?.copyWith(
//                       //       color: Colors.white,
//                       //       fontWeight: FontWeight.bold,
//                       //     ),
//                     ),
//                     const SizedBox(height: 30),
//                     Form(
//                       key: _formKey,
//                       child: Column(
//                         children: [
//                           TextFormField(
//                             controller: _emailController,
//                             decoration: InputDecoration(
//                               hintText: 'Email',
//                               filled: true,
//                               fillColor: Colors.white.withOpacity(0.8),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                                 borderSide: BorderSide.none,
//                               ),
//                               prefixIcon: const Icon(Icons.email, color: Colors.blue),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter your email';
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 20),
//                           TextFormField(
//                             controller: _passwordController,
//                             obscureText: _obscureText,
//                             decoration: InputDecoration(
//                               hintText: 'Password',
//                               filled: true,
//                               fillColor: Colors.white.withOpacity(0.8),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                                 borderSide: BorderSide.none,
//                               ),
//                               prefixIcon: const Icon(Icons.lock, color: Colors.blue),
//                               suffixIcon: IconButton(
//                                 icon: Icon(
//                                   _obscureText ? Icons.visibility : Icons.visibility_off,
//                                   color: Colors.blue,
//                                 ),
//                                 onPressed: () {
//                                   setState(() {
//                                     _obscureText = !_obscureText;
//                                   });
//                                 },
//                               ),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter your password';
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 30),
//                           ElevatedButton(
//                             onPressed: _login,
//                             style: ElevatedButton.styleFrom(
//                               //primary: Colors.white,
//                               //onPrimary: Colors.blue,
//                               padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                             ),
//                             child: const Text(
//                               'Login',
//                               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     TextButton(
//                       onPressed: () {
//                         // Add forgot password logic
//                         print('Forgot password pressed');
//                       },
//                       child: const Text(
//                         'Forgot Password?',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),


              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'First name'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your First name';
                  }
                  return null;
                },
              ),

              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Last name'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Last name';
                  }
                  return null;
                },
              ),

              DropdownButton<String>(
                  hint: Text('Select an option'),
                  value: _selectedValue,
                  items: _items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedValue = newValue;
            });
          },
        ),


              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),


              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _authService.authenticateUser(
            _emailController.text, _passwordController.text);
        // Navigate to home page or show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful')),
        );
        // Navigate to home page
        // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: ${e.toString()}')),
        );
      }
    }
  }

  void _signUp() async{

  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
