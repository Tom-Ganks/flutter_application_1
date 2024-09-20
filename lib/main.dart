import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const EleitorApp());
}

class EleitorApp extends StatelessWidget {
  const EleitorApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: EleitorPage(),
    );
  }
}

class EleitorPage extends StatefulWidget {
  const EleitorPage({super.key});

  @override
  State<EleitorPage> createState() => _EleitorPageState();
}

class _EleitorPageState extends State<EleitorPage> {
  TextEditingController idadeController = TextEditingController();
  String resultado = '';
  int idade = 0;
  Color cor = Colors.black;

  verificaClasseEleitoral() {
    idade = int.parse(idadeController.text);

    if (idade < 16) {
      resultado = 'NÃO ELEITOR';
      cor = Colors.red;
    } else if (idade >= 18 && idade <= 65) {
      // '&&' igual a 'AND' NO PYTHON
      resultado = 'ELEITOR OBRIGATORIO';
      cor = Colors.green;
    } else {
      resultado = 'ELEITOR FACULTATIVO';
      cor = Colors.blue;
    }
    setState(() {
      resultado;
      idade;
      idadeController.clear();
      cor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ClasseEleitoral'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: idadeController,
              decoration: const InputDecoration(
                labelText: 'Informe sua Idade:',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter
                    .digitsOnly, // Permite apenas números
              ],
              onSubmitted: (value) => verificaClasseEleitoral(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: verificaClasseEleitoral,
                child: const Text('Verificar')),
            const SizedBox(height: 32),
            Text(
              idade == 0 ? '' : 'idade: $idade',
              style: TextStyle(
                  fontSize: 20,
                  color: cor,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              resultado == '' ? '' : 'Classe Eleitoral: $resultado',
              style: TextStyle(
                  fontSize: 20,
                  color: cor,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
