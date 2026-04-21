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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // WIDGET 1 -> CircleAvatar
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                'https://i.imgur.com/BoN9kdC.png',
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Karine Johann",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text(
              "Desenvolvedora Flutter",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 30),

            // WIDGET 2 -> Card
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

  void adicionarItem() {
    if (controller.text.isNotEmpty) {
      setState(() {
        itens.add(controller.text);
      });
      controller.clear();
    }
  }

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

            // WIDGET 3 -> TextField
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: "Adicionar item",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: adicionarItem,
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: itens.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(itens[index]),
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