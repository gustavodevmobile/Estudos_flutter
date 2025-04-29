import 'package:cloud_firestore3/authentication/services/auth_service.dart';
import 'package:cloud_firestore3/authentication/widgets/show_snackbar.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_firebase_authentication/_core/my_colors.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmaController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();

  bool isEntrando = true;

  final _formKey = GlobalKey<FormState>();

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.all(32),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.network(
                      "https://github.com/ricarthlima/listin_assetws/raw/main/logo-icon.png",
                      height: 64,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        (isEntrando)
                            ? "Bem vindo ao Listin!"
                            : "Vamos começar?",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      (isEntrando)
                          ? "Faça login para criar sua lista de compras."
                          : "Faça seu cadastro para começar a criar sua lista de compras com Listin.",
                      textAlign: TextAlign.center,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(label: Text("E-mail")),
                      validator: (value) {
                        if (value == null || value == "") {
                          return "O valor de e-mail deve ser preenchido";
                        }
                        if (!value.contains("@") ||
                            !value.contains(".") ||
                            value.length < 4) {
                          return "O valor do e-mail deve ser válido";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _senhaController,
                      obscureText: true,
                      decoration: const InputDecoration(label: Text("Senha")),
                      validator: (value) {
                        if (value == null || value.length < 4) {
                          return "Insira uma senha válida.";
                        }
                        return null;
                      },
                    ),
                    Visibility(
                      visible: isEntrando,
                      child: TextButton(
                        onPressed: () {
                          forgotMyPassword();
                        },
                        child: Text('Esqueci a senha.'),
                      ),
                    ),
                    Visibility(
                      visible: !isEntrando,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _confirmaController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              label: Text("Confirme a senha"),
                            ),
                            validator: (value) {
                              if (value == null || value.length < 4) {
                                return "Insira uma confirmação de senha válida.";
                              }
                              if (value != _senhaController.text) {
                                return "As senhas devem ser iguais.";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _nomeController,
                            decoration: const InputDecoration(
                              label: Text("Nome"),
                            ),
                            validator: (value) {
                              if (value == null || value.length < 3) {
                                return "Insira um nome maior.";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    //const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          botaoEnviarClicado();
                        },
                        child: Text(
                          (isEntrando) ? "Entrar" : "Cadastrar",
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isEntrando = !isEntrando;
                        });
                      },
                      child: Text(
                        (isEntrando)
                            ? "Ainda não tem conta?\nClique aqui para cadastrar."
                            : "Já tem uma conta?\nClique aqui para entrar",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  botaoEnviarClicado() {
    String email = _emailController.text;
    String senha = _senhaController.text;
    String nome = _nomeController.text;

    if (_formKey.currentState!.validate()) {
      if (isEntrando) {
        _entrarUsuario(email: email, senha: senha);
      } else {
        _criarUsuario(email: email, password: senha, name: nome);
      }
    }
  }

  forgotMyPassword() {
    String email = _emailController.text;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Email de recuperação enviado para \n $email.'),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Ok'))
            ],
          );
        });
    authService.resetPassword(email: email).then((error) {
      if (error == null) {
        showSnackBar(
            // ignore: use_build_context_synchronously
            context: context,
            menssege: 'Email de recuperação enviado com sucesso',
            isError: false);
      } else {
        // ignore: use_build_context_synchronously
        showSnackBar(context: context, menssege: error);
      }
    });
  }

  _entrarUsuario({required String email, required String senha}) {
    authService.enterUser(email: email, password: senha).then((error) {
      if (error == null) {
        // showSnackBar(
        //     // ignore: use_build_context_synchronously
        //     context: context,
        //     menssege: 'Login feito com sucesso',
        //     isError: false);
        //Navigator.pushNamed(context, 'homeScreen');
      } else {
        // ignore: use_build_context_synchronously
        showSnackBar(context: context, menssege: error);
      }
    });
  }

  _criarUsuario(
      {required String email, required String password, required String name}) {
    try {
      authService
          .registerUser(
        email: email,
        password: password,
        name: name,
      )
          .then((String? error) {
        if (error == null) {
          // showSnackBar(
          //     // ignore: use_build_context_synchronously
          //     context: context,
          //     menssege: 'Cadastro feito com sucesso',
          //     isError: false);
          print('Cadastro feito com sucesso');
        } else {
          // ignore: use_build_context_synchronously
          showSnackBar(context: context, menssege: error);
        }
      });

      // _emailController.text = '';
      // _senhaController.text = '';
      // _confirmaController.text = '';
      // _nomeController.text = '';
    } catch (err) {
      print('Erro ao cadastrar: $err');
    }
  }
}
