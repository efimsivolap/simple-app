import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_app/theme/app_colors.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my simple app'),
      ),
      body: ListView(
        children: [_HeaderWidget()],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _FormWidget(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'In order to use the editing and rating capabilities of TMDb, as well as get personal recoomendations you will need to login to your account. If you do not have an account, registering for an account is free and simple.',
            style: TextStyle(
                fontSize: 12, color: Color.fromARGB(255, 105, 104, 104)),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'register',
            style: TextStyle(fontSize: 14, color: AppColors.mainColorForMyApp),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'If you signed up but didn`t get your verification email.',
          style: TextStyle(
              fontSize: 12, color: Color.fromARGB(255, 105, 104, 104)),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'verify your email',
            style: TextStyle(fontSize: 14, color: AppColors.mainColorForMyApp),
          ),
        ),
      ],
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');
  String? errorText = null;
  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;
      Navigator.of(context).pushReplacementNamed('/');
      print('open app');
    } else {
      errorText = 'не верный логин или пароль';
    }
    setState(() {});
  }

  void _resetPassword() {
    print('reset password');
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
      fontSize: 16,
      color: AppColors.mainColorForMyApp,
    );
    final textFieldDecoration = const InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      isCollapsed: true,
    );
    final errorText = this.errorText;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 30,
      ),
      child: Column(
        children: [
          if (errorText != null)
            Text(
              errorText,
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          Text(
            'моё первое приложение',
            style: TextStyle(fontSize: 20, color: AppColors.mainColorForMyApp),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'username',
            style: textStyle,
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: textFieldDecoration,
            controller: _loginTextController,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'password',
            style: textStyle,
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: textFieldDecoration,
            controller: _passwordTextController,
            obscureText: true,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: ElevatedButton(
                  onPressed: _auth,
                  child: Text(
                    'login',
                    style: TextStyle(color: AppColors.mainColorForMyApp),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 240, 244, 245)),
                      textStyle: MaterialStateProperty.all(
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w100)),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10))),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'reset password',
                  style: TextStyle(
                      fontSize: 10, color: AppColors.mainColorForMyApp),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
