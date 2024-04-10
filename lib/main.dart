import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: false,
          colorSchemeSeed: Color.fromARGB(255, 192, 23, 207),
          brightness: Brightness.light),
      home: FeedbackPage(),
    );
  }
}

class FeedbackPage extends StatefulWidget{
  const FeedbackPage({
    super.key,
  });

  @override
  State<FeedbackPage> createState() => _FeedbackPage();

}

widgetTextField(){
  return TextField(
    decoration: InputDecoration(
      hintText: 'Deixe aqui seu feedback'
    ),
  );
}

class _FeedbackPage extends State<FeedbackPage>{

    final _formKey = GlobalKey<FormState>();
    final _emailFormController = TextEditingController();
    final _nomeFormController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: false,
          colorSchemeSeed: Color.fromARGB(255, 192, 23, 207),
          brightness: Brightness.light),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Feedback das Vendas'),
          actions: [
            IconButton(onPressed: () {
                print('Botão "sair" pressionado');
              },
              icon: Icon(Icons.exit_to_app_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 32,
              horizontal: 16,
            ),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Obrigado!', style: TextStyle(fontSize: 32),),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Deixe um feedback das compras que realizou:',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.contact_page),
                    ),
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return 'O "email" deve ser informado';
                      }
                    },
                    controller: _emailFormController,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.mail_outlined),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'O "nome" deve ser informada';
                      }
                    },
                    controller: _nomeFormController,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  widgetTextField(),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()){
                              final email = _emailFormController.text;
                              final nome = _nomeFormController.text;
                              print(email);
                              print(nome);
                            }
                          },
                          child: Text('Enviar'),
                        )
                      ),
                    ],
                  ), 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}