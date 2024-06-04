import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:beumed/Library/Extension_String.dart';
import 'package:provider/provider.dart';

import '../Class/Master.dart';
import '../Class/Model/Enum_TypeDecoration.dart';

class TextFieldCustom extends StatefulWidget {
  TextFieldCustom(
      {super.key,
      required this.text_labol,
      required this.text_default,
      this.secure = false,
      this.actionText = TextInputAction.next,
      List<String>? autofill,
      this.keyboardType = TextInputType.text,
      this.enabled = true,
      this.decoration = TypeDecoration.labolBord,
      List<TypeValidator>? listValidator,
      this.limit_char = 99,
      required this.onStringChanged,
      this.onValidator})
      : this.autofill = autofill ?? [],
        this.listValidator = listValidator ?? [];

  String text_default;              ///Testo da mostrare come sfondo
  String text_labol;                ///Testo da mostrare sul bordo del campo
  bool secure;                      ///Mostra/Nascondi il testo digitato
  TextInputAction actionText;       ///L'azione da effettuare premendo il tasto INVIO
  List<String> autofill;            ///Autocompletamento
  TextInputType keyboardType;       ///Tipologia di tastiera da mostrare
  bool enabled;                     ///Attiva/Disattiva il TextField
  TypeDecoration decoration;        ///Determina Decorazione Bordi

  List<TypeValidator> listValidator;  ///La lista delle validazioni da effetture

  int limit_char;       ///Limite dei caratteri all'interno della TextField

  final ValueChanged<String> onStringChanged;
  final ValueChanged<String>? onValidator;

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  @override
  Widget build(BuildContext context) {
    var master = Provider.of<Master>(context, listen: false);
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        initialValue: widget.text_default,
        enabled: widget.enabled,
        textInputAction: widget.actionText,
        obscureText: widget.secure,
        keyboardType: widget.keyboardType,
        autofillHints: widget.autofill,
        decoration: widget.decoration.value(context, widget.text_labol),
        inputFormatters: [
          LengthLimitingTextInputFormatter(widget.limit_char),
        ],
        onChanged: (String value) {
          setState(() {
            widget.onStringChanged(value);
          });
        },
        validator: FormBuilderValidators.compose([
          for (var element in widget.listValidator)
            element == TypeValidator.cf
                ? (valid) =>
                    valid.toString().isCF ? null : "Codice Fiscele non valido!"
                : element == TypeValidator.piva
                    ? (valid) =>
                        valid.toString().isPIVA ? null : "Partita Iva non valida!"
                    : element.value,
        ]),
      ),
    );
  }
}

enum TypeValidator {
  required,
  email,
  number,
  min,
  max,
  minLenght,
  maxLenght,
  cf,
  piva,
}

extension ExtTypeValidator on TypeValidator {
  dynamic get value {
    switch (this) {
      case TypeValidator.required:
        return FormBuilderValidators.required(errorText: 'Campo Obbligatorio');
      case TypeValidator.email:
        return FormBuilderValidators.email(
            errorText: 'Formato mail non valido');
      case TypeValidator.number:
        return FormBuilderValidators.numeric(
            errorText: 'Formato non corretto, inserire un valore [0-9]');
      case TypeValidator.min:
        return FormBuilderValidators.min(1,
            errorText: 'Inserire almeno un valore');
      case TypeValidator.max:
        return FormBuilderValidators.max(10000000,
            errorText: 'Valore inserito troppo alto');
      case TypeValidator.minLenght:
        return FormBuilderValidators.minLength(1,
            errorText:
                'Inserire almeno un valore, il campo non può essere vuoto');
      case TypeValidator.maxLenght:
        return FormBuilderValidators.maxLength(10000,
            errorText: 'Valore troppo grande, inserire un valore più piccolo');
      case TypeValidator.cf:
        return null; //FormBuilderValidators.cf(errorText: 'Codice Fiscale non valido');
      case TypeValidator.piva:
        return null;
    }
  }
}

