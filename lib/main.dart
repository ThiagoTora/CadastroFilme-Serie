import 'package:flutter/material.dart';

void main() => runApp(FilmesApp());

class Filme {
  String titulo;
  String diretor;
  String genero;
  double nota;
  int duracao;
  String sinopse;
  String imagemUrl;
  bool assistido;
  bool recomenda;

  Filme({
    required this.titulo,
    required this.diretor,
    required this.genero,
    required this.nota,
    required this.duracao,
    required this.sinopse,
    required this.imagemUrl,
    required this.assistido,
    required this.recomenda,
  });
}

class FilmesApp extends StatefulWidget {
  @override
  _FilmesAppState createState() => _FilmesAppState();
}

class _FilmesAppState extends State<FilmesApp> {
  final List<Filme> filmes = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Filmes',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: CadastroScreen(onAdd: (filme) {
        setState(() {
          filmes.add(filme);
        });
      }, filmes: filmes),
    );
  }
}

class CadastroScreen extends StatefulWidget {
  final Function(Filme) onAdd;
  final List<Filme> filmes;

  CadastroScreen({required this.onAdd, required this.filmes});

  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();
  final _tituloController = TextEditingController();
  final _diretorController = TextEditingController();
  final _generoController = TextEditingController();
  final _duracaoController = TextEditingController();
  final _sinopseController = TextEditingController();
  final _imagemUrlController = TextEditingController();
  bool _assistido = false;
  bool _recomenda = false;
  double _nota = 5;

  void _cadastrar() {
    if (_formKey.currentState!.validate()) {
      final filme = Filme(
        titulo: _tituloController.text,
        diretor: _diretorController.text,
        genero: _generoController.text,
        nota: _nota,
        duracao: int.tryParse(_duracaoController.text) ?? 0,
        sinopse: _sinopseController.text,
        imagemUrl: _imagemUrlController.text,
        assistido: _assistido,
        recomenda: _recomenda,
      );

      widget.onAdd(filme);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ListaScreen(filmes: widget.filmes),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de Filme/Série')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(controller: _tituloController, decoration: InputDecoration(labelText: 'Título'), validator: (v) => v!.isEmpty ? 'Informe o título' : null),
              TextFormField(controller: _diretorController, decoration: InputDecoration(labelText: 'Diretor(a)'), validator: (v) => v!.isEmpty ? 'Informe o diretor' : null),
              TextFormField(controller: _generoController, decoration: InputDecoration(labelText: 'Gênero')),
              TextFormField(
                controller: _duracaoController,
                decoration: InputDecoration(labelText: 'Duração (min)'),
                keyboardType: TextInputType.number,
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Informe a duração';
                  if (int.tryParse(v) == null) return 'Digite um número válido';
                  return null;
                },
              ),
              TextFormField(controller: _sinopseController, decoration: InputDecoration(labelText: 'Sinopse'), validator: (v) => v!.isEmpty ? 'Informe a sinopse' : null),
              TextFormField(controller: _imagemUrlController, decoration: InputDecoration(labelText: 'URL do Cartaz'), validator: (v) => v!.isEmpty ? 'Informe a URL do cartaz' : null),
              CheckboxListTile(title: Text('Assistido?'), value: _assistido, onChanged: (v) => setState(() => _assistido = v!)),
              SwitchListTile(title: Text('Recomendaria?'), value: _recomenda, onChanged: (v) => setState(() => _recomenda = v)),
              Text('Nota: ${_nota.toStringAsFixed(1)}'),
              Slider(value: _nota, min: 0, max: 10, divisions: 20, label: _nota.toStringAsFixed(1), onChanged: (v) => setState(() => _nota = v)),
              SizedBox(height: 10),
              ElevatedButton(onPressed: _cadastrar, child: Text('Cadastrar Filme')),
            ],
          ),
        ),
      ),
    );
  }
}

class ListaScreen extends StatelessWidget {
  final List<Filme> filmes;

  ListaScreen({required this.filmes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filmes/Séries (${filmes.length})')),
      body: ListView.builder(
        itemCount: filmes.length,
        itemBuilder: (context, index) {
          final filme = filmes[index];
          return ListTile(
            leading: Image.network(filme.imagemUrl, width: 50, height: 50, errorBuilder: (_, __, ___) => Icon(Icons.error)),
            title: Text(filme.titulo),
            subtitle: Text('Diretor: ${filme.diretor}\nNota: ${filme.nota.toStringAsFixed(1)}'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => DetalhesScreen(filme: filme)),
            ),
          );
        },
      ),
    );
  }
}

class DetalhesScreen extends StatelessWidget {
  final Filme filme;

  DetalhesScreen({required this.filme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalhes')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.network(filme.imagemUrl, height: 200, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Icon(Icons.error, size: 100)),
            SizedBox(height: 12),
            Text(filme.titulo, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text('Diretor: ${filme.diretor}'),
            Text('Gênero: ${filme.genero}'),
            Text('Duração: ${filme.duracao} min'),
            Text('Sinopse:\n${filme.sinopse}'),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(filme.assistido ? Icons.check_circle : Icons.cancel, color: filme.assistido ? Colors.green : Colors.red),
                SizedBox(width: 8),
                Text(filme.assistido ? 'Assistido' : 'Não assistido'),
              ],
            ),
            Row(
              children: [
                Icon(filme.recomenda ? Icons.thumb_up : Icons.thumb_down, color: filme.recomenda ? Colors.blue : Colors.grey),
                SizedBox(width: 8),
                Text(filme.recomenda ? 'Recomenda' : 'Não recomenda'),
              ],
            ),
            Text('Nota: ${filme.nota.toStringAsFixed(1)}'),
          ],
        ),
      ),
    );
  }
}
