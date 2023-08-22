// ignore_for_file: public_member_api_docs, no-magic-number

/// Extensão criada para acrescentar métodos na classe num,
/// sem modificar a implementação original da classe.
extension NumX on num {
  /// Método `formatMeter` serve para transformar qualquer número para
  /// a unidade de medida metro, onde dentro do seu código, ele realiza
  /// uma divisão do número por 10 e limita o número de casas decimais
  /// para apenas 1.
  String formatMeter() => '${(this / 10).toStringAsFixed(1)}m';

  /// Método `formatMeter` serve para transformar qualquer número para a
  /// unidade de medida kilograma, onde dentro do seu código, ele realiza uma
  /// divisão do número por 10 e limita o número de casas decimais
  /// para apenas 1.
  String formatKilogram() => '${(this / 10).toStringAsFixed(1)}kg';
}
