// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:scrumpoker/socket.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, String this.title = ''}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validateAndJoin() {
    SocketApi socketApi = SocketApi();
    print(socketApi.socket.id);
    print(socketApi.newRoom());
    final FormState? form = _formKey.currentState;
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('Seja Bem Vindo ao Scrum Poker'),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Form(
              key: _formKey,
              child: TextFormField(
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    child: const Icon(Icons.arrow_forward_ios),
                    onTap: validateAndJoin,
                  ),
                  labelText: 'Sala',
                  hintText: 'Digite o numero da sala',
                  border: const OutlineInputBorder(),
                ),
                onFieldSubmitted: (value) {
                  validateAndJoin();
                },
                validator: (String? value) {
                  if (value != null) {
                    return 'Digite uma sala valida.';
                  }
                  return null;
                },
              ),
            ),
          ),
          const SizedBox(height: 5),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: validateAndJoin,
                  child: const Text('Entrar'),
                ),
                const Text('ou'),
                TextButton(
                  onPressed: () {},
                  child: const Text('Criar nova sala !!!'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
