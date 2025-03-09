# Tá na Conta

O **Tá na Conta** é um sistema de vendas via Pix que utiliza QR Codes para facilitar transações. Desenvolvido em Flutter e utilizando o GetX para gerenciamento de estado, o aplicativo oferece uma experiência fluida e reativa, permitindo desde o login até a criação e monitoramento de transações via Pix.

---

## Descrição do Projeto

O projeto possibilita que o usuário:
- Realize login com segurança.
- Acesse uma tela inicial que exibe o extrato de transações.
- Crie QR Codes Pix através de uma interface intuitiva, que inclui:
  - Teclado numérico para inserção do valor.
  - Seleção de tempo de expiração.
  - Campo para descrição da transação.
- Visualize o QR Code gerado em uma tela dedicada, que exibe também:
  - Um timer de expiração.
  - Botões para compartilhar e copiar o código (opção "copia e cola").
- Receba notificações quando o pagamento é realizado dentro do prazo, atualizando o estado da transação.

---

## Funcionalidades

- **Autenticação:** Tela de login para acesso seguro.
- **Extrato:** Tela inicial que apresenta o histórico de transações.
- **Geração de QR Code Pix:** Criação de QR Code com personalização do valor, tempo de expiração e descrição.
- **Monitoramento de Transações:** Notificações e atualização do status das transações conforme o pagamento é efetuado.
- **Compartilhamento:** Opção de compartilhar o QR Code via cópia para a área de transferência.

---

## Tecnologias Utilizadas

- **Flutter:** Framework principal para desenvolvimento mobile.
- **GetX:** Gerenciamento de estado, injeção de dependências e navegação.
- **Pacotes Adicionais:**
  - `animate_do`
  - `flutter_native_splash`
  - `qr_flutter`
  - `intl`
  - `connectivity_plus`
  - `flutter_shake_animated`
  - `shared_preferences`
  - `dotted_border`
  - `sks_ticket_view`
  - `pdf`
  - `printing`
  - `time_picker_sheet` (via Git)

---

## Estrutura do Projeto

A estrutura do projeto está organizada de forma modular para facilitar a manutenção e escalabilidade:

```
lib/
├─ app/
│  ├─ data/
│  │  ├─ app_assets.dart
│  │  ├─ app_storage_keys.dart
│  │  └─ app_strings.dart
│  ├─ exceptions/
│  │  └─ app_exceptions.dart
│  ├─ models/
│  │  └─ paymment_model.dart
│  ├─ modules/
│  │  ├─ home/
│  │  │  ├─ bindings/
│  │  │  │  └─ home_binding.dart
│  │  │  ├─ controllers/
│  │  │  │  └─ home_controller.dart
│  │  │  └─ views/
│  │  │     ├─ home_view.dart
│  │  │     └─ paymment_recipient_screen.dart
│  │  ├─ login/
│  │  │  ├─ bindings/
│  │  │  │  └─ login_binding.dart
│  │  │  ├─ controllers/
│  │  │  │  └─ login_controller.dart
│  │  │  ├─ views/
│  │  │  │  └─ login_view.dart
│  │  │  └─ widgets/
│  │  │     ├─ shake_widget.dart
│  │  │     ├─ shakeable_login_form.dart
│  │  │     └─ v_painter.dart
│  │  └─ payments/
│  │     ├─ bindings/
│  │     │  └─ payments_binding.dart
│  │     ├─ controllers/
│  │     │  └─ payments_controller.dart
│  │     └─ views/
│  │        ├─ payments_view.dart
│  │        └─ qr_code_view.dart
│  ├─ routes/
│  │  ├─ app_pages.dart
│  │  └─ app_routes.dart
│  ├─ services/
│  │  └─ connectivity_service.dart
│  └─ theme/
│     ├─ app_buttons.dart
│     ├─ app_colors.dart
│     ├─ app_decorations.dart
│     ├─ app_text_styles.dart
│     └─ app_theme.dart
└─ main.dart
```

---

## Pubspec.yaml

O arquivo `pubspec.yaml` contém as dependências essenciais para o funcionamento do projeto. Confira o trecho abaixo:

```yaml
name: ta_na_conta
description: "A new Flutter project."

publish_to: 'none' # Remova esta linha se desejar publicar no pub.dev

version: 1.0.0+1

environment:
  sdk: ^3.6.1

dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.8
  get: ^4.6.6
  animate_do: ^4.0.1
  flutter_native_splash: ^2.4.4
  qr_flutter: ^4.1.0
  intl: ^0.20.2
  connectivity_plus: ^6.1.3
  flutter_shake_animated: ^0.0.5
  shared_preferences: ^2.5.2
  dotted_border: ^2.1.0
  sks_ticket_view: ^1.0.0
  pdf: ^3.11.3
  printing: ^5.14.2
  
  time_picker_sheet:
    git:
      url: https://github.com/MikaelDDavidd/time-picker-sheet
      ref: master

dev_dependencies:
  flutter_test:
    sdk: flutter

  flutter_lints: ^5.0.0

flutter:
  uses-material-design: true

  assets:
    - assets/
```

---

## Instalação e Execução

### Pré-requisitos
- Flutter instalado e configurado na máquina.
- Ambiente configurado para desenvolvimento Android e/ou iOS.

### Passos para Executar o Projeto

1. **Clone o Repositório:**
   ```bash
   git clone <URL_DO_REPOSITÓRIO>
   cd ta_na_conta
   ```

2. **Instale as Dependências:**
   ```bash
   flutter pub get
   ```

3. **Execute o Projeto:**
   - Para **Android**:
     ```bash
     flutter run
     ```
   - Para **iOS**:
     ```bash
     flutter run --flavor ios
     ```

---

## Screenshots

### Android
<!-- Adicione aqui os screenshots do app rodando em Android -->
![Android Screenshot](./screenshots/android.png)

### iOS
<!-- Adicione aqui os screenshots do app rodando em iOS -->
![iOS Screenshot](./screenshots/ios.png)

---

## Contribuição

Contribuições são bem-vindas! Siga os passos abaixo para colaborar:

1. Faça um fork do repositório.
2. Crie uma branch para a sua feature:
   ```bash
   git checkout -b minha-feature
   ```
3. Realize as alterações e efetue um commit:
   ```bash
   git commit -m 'Adiciona nova feature'
   ```
4. Envie sua branch para o repositório remoto:
   ```bash
   git push origin minha-feature
   ```
5. Abra um Pull Request.

---

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

---

### Contato

Caso tenha dúvidas ou sugestões, sinta-se à vontade para abrir uma _issue_ ou entrar em contato.
