// ignore_for_file: public_member_api_docs

/// Extensão criada para acrescentar um método na classe do tipo de dado int,
/// sem modificar a implementação original da classe.
extension IntX on int {
  /// O método `formatID()` serve para formatar o índice de cada pokémon
  ///  na lista. Por exemplo, o pokémon de índice 3, ao utilizar o método
  /// `formatID()`, ao invés de ser representado da forma convencional, "3",
  ///  ele transformará o número inteiro em uma **String**, devido ao método
  /// `toString()` e acrescentará três zeros do lado esquerdo do índice, por
  /// conta do método `padLeft()`, sendo formatado desta forma: "#0003",
  String formatID() {
    return '#${toString().padLeft(3, '0')}';
  }
}
