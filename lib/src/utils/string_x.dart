// ignore_for_file: public_member_api_docs, avoid-substring

/// Extensão `StringX` foi criada para adicionar métodos na classe do
/// tipo string sem alterar a implementação original da classe, a partir disso
/// podendo ser utilizada em qualquer string criada na aplicação.
extension StringX on String {
  /// Método criado para formatar o texto, fazedo com que a string utilizada
  /// tenha a primeira letra sempre maiúscula e o restante das letras
  /// sempre minúsculas.
  String capitalizeFirst() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  /// Método criado para capitalizar a primeira letra de cada palavra de uma
  /// frase. O método `replaceAll()` é utilizado para tirar os espaços duplos
  /// da string e deixar um espaço único, o `split()` vai dividir a frase em
  /// várias palavras, o `map()` vai pegar cada uma dessas palavras e
  /// captalizar e no final a função `join()` irá juntar tudo de novo.
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.capitalizeFirst())
      .join(' ');

  /// Esse método serve para adicionar o símbolo de informação por meio de um
  /// código unicode.
  String addInfoChar() => '\u24D8 $this';
}
