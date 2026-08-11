import 'package:flutter/material.dart';
import '../dados_mock.dart';


class LoginPage extends StatefulWidget{
  const LoginPage ({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
    
}

class _LoginPageState extends State<LoginPage>{

  final TextEditingController emailController =TextEditingController();
  final TextEditingController senhaController =TextEditingController();

  bool esconderSenha = true;

  void mostrarMensagem(String mensagem){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:Text(mensagem)
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40,),

            const Icon(
              Icons.account_circle,
              size: 100,
            ),

            const SizedBox(height: 20,),

            const Text(
              'Bem vindo',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(height: 5,),

            const Text(
              'Entre com a sua conta para acessar o sistema',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 5,),

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Digite seu email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15,),

            TextField(
              controller: senhaController,
              obscureText: esconderSenha,
              decoration: InputDecoration(
                labelText: 'Senha',
                hintText: 'Digite sua senha',
                prefixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(),

                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      esconderSenha = !esconderSenha;
                    });
                  }
                , icon: Icon(
                  esconderSenha ? Icons.visibility : Icons.visibility_off
                  )
                ),
              ),
            ),

            const SizedBox(height: 25,),

            ElevatedButton.icon(
              onPressed: (){},
              icon: Icon(Icons.login),
              label: const Text('Entrar')
            ),

            const SizedBox(height: 10,),

            OutlinedButton.icon(
              onPressed: (){},
              icon: Icon(Icons.person_add),
              label: const Text('Criar usuário'),
            ),

          ],
        ),
      )
    );
  }
}