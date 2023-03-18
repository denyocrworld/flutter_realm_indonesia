import 'package:flutter/material.dart';
import 'package:realm_basic/core.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1529655683826-aba9b3e77383?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 900),
            opacity: 0.6,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black,
                    Colors.black,
                    Colors.black,
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Text(
                    "Ciko",
                    style: GoogleFonts.satisfy(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          controller.signUpMode ? "Create account" : "Login",
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        QTextField(
                          label: "Email",
                          hint: "Your email",
                          validator: Validator.email,
                          suffixIcon: Icons.email,
                          value: controller.email,
                          onChanged: (value) {
                            controller.email = value;
                          },
                        ),
                        QTextField(
                          label: "Password",
                          hint: "Your password",
                          obscure: true,
                          validator: Validator.required,
                          suffixIcon: Icons.password,
                          value: controller.password,
                          onChanged: (value) {
                            controller.password = value;
                          },
                        ),
                        const Divider(),
                        if (!controller.signUpMode)
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 42,
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.login),
                              label: const Text("Login"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                              ),
                              onPressed: () => controller.doLogin(),
                            ),
                          ),
                        if (controller.signUpMode)
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 42,
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.login),
                              label: const Text("Signup"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                              ),
                              onPressed: () => controller.doSignUp(),
                            ),
                          ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        InkWell(
                          onTap: () => controller.updateMode(),
                          child: Text(
                            controller.signUpMode ? "Login" : "Create account",
                            style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
