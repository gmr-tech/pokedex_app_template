// ignore_for_file: public_member_api_docs

/// `CommonPresentConst` foi criada para armazenar valores de forma
/// constante, que serão utilizados em toda aplicação, como tempo de
/// duração de animações e outros valores comuns.
class CommonPresentConst {
  /// Variável criada para determinar o tamanho máximo em largura da janela de
  /// exibição.
  static const double maxViewportWidth = 640;

  /// Tempo de depuração padrão para entrada do usuário em milissegundos
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
