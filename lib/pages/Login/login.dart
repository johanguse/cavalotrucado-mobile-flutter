import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //Variaveis dos valores corretos
  @override
  void initState() {
    emailcontroller.text = "123.456.789/12";
    passwordcontroller.text = "123";
    super.initState();
  }

  bool _showPassword = false;
  final _formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var decoracao;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Form(
                      key: _formkey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/imgs/onaccesslogo.png",
                                width: MediaQuery.of(context).size.width / 3,
                              ),
                            ),
                            const SizedBox(
                              height: 10 * 3,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: 20.0, bottom: 3.5),
                              child: Text("CPF",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 10),
                                child: TextFormField(
                                  controller: emailcontroller,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Campo Obrigatório!";
                                    }
                                    return null;
                                  },
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 10),
                                child: Column(children: [
                                  TextFormField(
                                    controller: passwordcontroller,
                                    validator: (String? cpf) {
                                      if (cpf!.isEmpty) {
                                        return "Campo obrigatório";
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.text,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Senha",
                                      enabledBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide()),
                                      suffixIcon: GestureDetector(
                                        child: Icon(
                                          _showPassword == false
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            _showPassword = !_showPassword;
                                          });
                                        },
                                      ),
                                    ),
                                    obscureText:
                                        _showPassword == false ? true : false,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 56,
                                    child: ElevatedButton(
                                      onPressed: _open,
                                      child: _title(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    "Já possui inscrição?",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: const Text(
                                      "Clique Aqui",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ))));
  }

  _title() => const Text("Entrar",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white));

  _open() async {
    if (!_formkey.currentState!.validate()) return;

    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => primeira()));
  }
}
