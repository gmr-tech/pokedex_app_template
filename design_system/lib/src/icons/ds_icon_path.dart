// ignore_for_file: public_member_api_docs

/// String constante criada para facilitar a utilização do caminho da pasta
/// de ícones.
// O path não precisa estar em uma classe
// ignore: prefer-static-class
const _path = 'assets/icons';

/// Enum criado para facilitar a utilização do caminho de cada ícone, evitando
/// erros de digitação e tornando mais prático, como por exemplo, para conseguir
/// pegar o caminho do ícone de `pokeball`, basta:
///
/// > `DSIconPath.pokeball.path`
enum DSIconPath {
  pokeball('$_path/pokeball.svg'),
  straighten('$_path/straighten.svg'),
  weight('$_path/weight.svg');

  /// Aqui temos um construtor constante, ou seja, após ter sido
  /// atribuído um valor a ela em tempo de compilação, o valor dela não pode
  /// ser mais alterado, sendo assim constante.
  const DSIconPath(this.path);

  /// Aqui temos o atributo do construtor do enum `DSIconPath`,
  final String path;
}
