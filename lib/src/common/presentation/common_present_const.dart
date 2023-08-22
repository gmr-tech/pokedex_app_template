// ignore_for_file: public_member_api_docs

/// `CommonPresentConst` é uma classe criada para armazenar valores comuns que
/// serão utilizados na aplicação de forma constante.
class CommonPresentConst {
  /// Time in milliseconds to avoid flashing when loading data
  static const int antiFlashingTime = 1000;

  /// Constraint the max width of the viewport to avoid adaptive code tasks
  static const double maxViewportWidth = 640;

  /// Standard debounce time for user input in milliseconds
  static const int debounceTime = 500;

  /// Rápida duração da animação.
  static const int fastAnimationDuration = 200;

  /// Média duração da animação.
  static const int mediumAnimationDuration = 300;

  /// Opacidade média para as cores utilizadas na aplicação.
  static const double midOpacity = 0.5;

  /// Opacidade alta para as cores utilizadas na aplicação.
  static const double highOpacity = 0.75;

  /// Valor criado como teste para indicador de progresso.
  static const double progressIndicatorTestValue = 0.75;
}
