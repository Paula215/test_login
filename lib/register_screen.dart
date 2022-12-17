import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_proyect_01/home_page.dart';
import 'package:login_proyect_01/model/user.dart';
import 'package:login_proyect_01/widgets/box.dart';
import 'package:login_proyect_01/widgets/buttons/button_for_alert.dart';
import 'package:login_proyect_01/widgets/buttons/button_sing_out.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  User user = User("", "", "");
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Title(),
            const SizedBox(height: 46),
            Form(
                child: Column(
              children: [
                Cajita(
                  label: 'Your name',
                  placeholder: 'Juanito Perez',
                  controller: nameController,
                ),
                const SizedBox(height: 30),
                Cajita(
                  label: 'Your email',
                  placeholder: 'juanitopez@gmail.com',
                  email: true,
                  controller: emailController,
                ),
                const SizedBox(height: 30),
                Cajita(
                  label: 'Your password',
                  invisible: true,
                  placeholder: 'Password',
                  controller: passwordController,
                ),
                const SizedBox(height: 40),
                ButtonLongIn(
                  label: 'Sign Up ',
                  onTap: () async {
                    user.name = nameController!.text;
                    user.email = emailController!.text;
                    user.password = passwordController!.text;
                    await showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return AlertDialog(
                          content: Container(
                            height: 200,
                            child: Column(children: [
                              const Text(
                                "¿Are you sure you want to register?",
                                style: TextStyle(),
                              ),
                              const SizedBox(height: 10),
                              const Text("User information: "),
                              const SizedBox(height: 20),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text("Your name:  "),
                                      Text(user.name!),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text("Your email: "),
                                      Text(user.email!),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ButtonAlert(
                                    label: 'accept',
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage()));
                                    },
                                  ),
                                  ButtonAlert(
                                    label: 'cancel',
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              )
                            ]),
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            ))
          ],
        ),
      ),
    ));
  }
}

Widget inputEmail(BuildContext context, TextEditingController emailController) {
  return Column(
    children: [
      Container(
          width: 350,
          height: 52,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
              controller: emailController,
              validator: (String? value) {
                return (!value!.contains('@')) ? "Not is a valid email" : null;
              },
              decoration: InputDecoration(
                  hintText: "Ingrese su email",
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 29, 38, 157)!)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade100))))),
    ],
  );
}

Widget inputTextFullName(
    BuildContext context, TextEditingController fullNameController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Full name"),
      SizedBox(height: 5),
      Container(
          width: 350,
          height: 52,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
              validator: (String? value) {
                return (value!.isEmpty) ? "No puede ser vacio" : null;
              },
              controller: fullNameController,
              decoration: InputDecoration(
                  hintText: "Ingrese su nombre completo",
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 29, 38, 157)!)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade100))))),
    ],
  );
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 100,
          ),
          Text(
            'Sign Up',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontSize: 45,
                color: Color.fromARGB(255, 27, 33, 81),
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'To join the banana lovers community',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 27, 33, 81),
              ),
            ),
          ),
        ]),
      ]),
    );
  }
}
