import 'package:flutter/services.dart';

class PhoneMaskedFormatter extends TextInputFormatter {
  final String _prefix = '55829';

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Garante o prefixo fixo no início
    if (!digitsOnly.startsWith(_prefix)) {
      digitsOnly = _prefix + digitsOnly;
    }

    // Limita a 13 dígitos
    if (digitsOnly.length > 13) {
      digitsOnly = digitsOnly.substring(0, 13);
    }

    // Aplica a máscara: +55 82 9XXXX XXXX
    String masked = '+';
    for (int i = 0; i < digitsOnly.length; i++) {
      if (i == 0) {
        masked += digitsOnly[i];
      } else if (i == 1) {
        masked += '${digitsOnly[i]} ';
      } else if (i == 2) {
        masked += digitsOnly[i];
      } else if (i == 3) {
        masked += digitsOnly[i];
      } else if (i == 4) {
        masked += ' ${digitsOnly[i]}';
      } else if (i == 5) {
        masked += digitsOnly[i];
      } else if (i == 6) {
        masked += digitsOnly[i];
      } else if (i == 7) {
        masked += digitsOnly[i];
      } else if (i == 8) {
        masked += ' ${digitsOnly[i]}';
      } else {
        masked += digitsOnly[i];
      }
    }

    return TextEditingValue(
      text: masked,
      selection: TextSelection.collapsed(offset: masked.length),
    );
  }

  static String unmask(String maskedPhone) {
    return maskedPhone.replaceAll(RegExp(r'\D'), '');
  }
}


