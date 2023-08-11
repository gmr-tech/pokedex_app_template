// ignore_for_file: public_member_api_docs

/// Esta classe é criada como forma de adicionar propriedades **_required_**,
/// ou seja, propriedades obrigatórias para cada instância da classe
/// **PokemonAboutProperties** existente, como:
///
/// * altura (height);
/// * largura (weight);
/// * movimentos (moves).
class PokemonAboutProperties {
  PokemonAboutProperties({
    required this.height,
    required this.weight,
    required this.moves,
  });

  final int height;
  final double weight;
  final List<String> moves;
}
