import 'package:flutter/material.dart';

void main() {
  runApp(const MeuCurriculoApp());
}

class MeuCurriculoApp extends StatelessWidget {
  const MeuCurriculoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currículo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const TelaInicial(),
    );
  }
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu Currículo"),
        centerTitle: true,
      ),

      // aqui é o corpo da tela
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // minha foto bonitinha
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('imagens/eu.jpg'),
            ),

            const SizedBox(height: 15),

            // meu nome
            const Text(
              "Karine Johann",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            // minha função
            const Text(
              "Desenvolvedora Flutter",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 30),

            // parte da escolaridade
            Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: const Icon(Icons.school),
                title: const Text("Escolaridade"),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const TelaLista(titulo: "Escolaridade"),
                    ),
                  );
                },
              ),
            ),

            // parte dos projetos
            Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: const Icon(Icons.work),
                title: const Text("Projetos"),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const TelaLista(titulo: "Projetos"),
                    ),
                  );
                },
              ),
            ),

            // recomendações
            Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: const Icon(Icons.star),
                title: const Text("Recomendações"),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const TelaLista(titulo: "Recomendações"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TelaLista extends StatefulWidget {
  final String titulo;

  const TelaLista({super.key, required this.titulo});

  @override
  State<TelaLista> createState() => _TelaListaState();
}

class _TelaListaState extends State<TelaLista> {
  List<String> itens = [];
  TextEditingController controller = TextEditingController();

  // adiciona item na lista
  void adicionarItem() {
    if (controller.text.isNotEmpty) {
      setState(() {
        itens.add(controller.text);
      });
      controller.clear();
    }
  }

  // remove item da lista
  void removerItem(int index) {
    setState(() {
      itens.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titulo),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),

            // aqui digita o que vai adicionar
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: "Adicionar item",
                border: const OutlineInputBorder(),

                // botão de adicionar
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: adicionarItem,
                ),
              ),
            ),
          ),

          // lista dos itens
          Expanded(
            child: ListView.builder(
              itemCount: itens.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(itens[index]),

                  // botão de apagar
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => removerItem(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
