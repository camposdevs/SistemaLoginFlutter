import 'package:flutter/material.dart';
import '../dados_mock.dart';

class CadastroPage  extends StatefulWidget{
  const CadastroPage ({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage>{

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmaSenhaController = TextEditingController();

  bool esconderSenha = true;
  bool esconderConfirmacao = true;

  void cadastrar(){
    String nome = nomeController.text.trim();
    String email = emailController.text.trim();
    String senha = senhaController.text;
    String confirmaSenha = confirmaSenhaController.text;

    if(nome.isEmpty || email.isEmpty || senha.isEmpty || confirmaSenha.isEmpty ){
      mostrarMensagem('Preencha todos os campos');
      return;
    }

    if(!email.contains('@')){
      mostrarMensagem(
        'Digite um email válido'
      );
      return;
    }

    if(senha.length < 4){
      mostrarMensagem(
        'a senha deve possuir pelo menos 4 caracteres.'
      );
      return;
    }

    if(senha != confirmaSenha){
      mostrarMensagem(
        'As senhas tem que ser iguais.'
      );
      return;
    }

    bool emailExiste = false;

    for(var usuario in usuarios){
      if(usuario['email'] == email){
        emailExiste = true;
        return;
      }
    }

    if(emailExiste){
      mostrarMensagem(
        'Já existe um usuário com esse email'
      );
      return;
    }

    usuarios.add(
      {
        'nome' : nome,
        'email': email,
        'senha': senha,
      }
    );

    mostrarMensagem('Usuário cadastrado com sucesso');
    Navigator.pop(context);

  }

  void mostrarMensagem(String mensagem){
    ScaffoldMessenger.of(context).showSnackBar((
      SnackBar(content: Text(mensagem),)));
  }

  @override
  void dispose(){
    nomeController.dispose();
    emailController.dispose();
    senhaController.dispose();
    confirmaSenhaController.dispose();

    super.dispose();
    
  }
 
  @override
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Criar usuário'
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            const Icon (Icons.person_add, size:90,
            ),

            const SizedBox(height: 15),

            const Text(
              'Criar conta',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                hintText: 'Digite seu nome',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder()
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'email',
                hintText: 'Digite seu email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder()
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: senhaController,
              obscureText: esconderSenha,
              decoration: InputDecoration(
                labelText: 'Senha',
                prefixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      esconderSenha =! esconderSenha;
                    }
                  );
                  }, icon: Icon(
                    esconderSenha ? Icons.visibility : Icons.visibility_off,
                  )
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: confirmaSenhaController,
              obscureText: esconderConfirmacao,
              decoration: InputDecoration(
                labelText: 'Confirma Senha',
                prefixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      esconderConfirmacao =! esconderConfirmacao;
                    }
                  );
                  }, icon: Icon(
                    esconderConfirmacao ? Icons.visibility : Icons.visibility_off,
                  )
                ),
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton.icon(
              onPressed: cadastrar, 
              icon: Icon(Icons.person_add) ,
              label: const Text('Cadastrar')
            ),

            const SizedBox(height: 10),

            OutlinedButton(
              onPressed: (){
                Navigator.pop(context);
              },
               child: const Text(
                'Voltar para o login',
              )
            )
          ],
        ),
      )
    );
  }
}