import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const Cadastro());

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: "Tela de cadastro dos alunos",
    theme: ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
    ),
    home: const TelaCadastro(),
  );
}

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});
  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController(),
      _emailController = TextEditingController(),
      _senhaController = TextEditingController();
  final _telefoneController = TextEditingController(),
      _cpfController = TextEditingController(),
      _rgController = TextEditingController();
  final _dataNascimentoController = TextEditingController();
  String? _estadoCivilSelecionado;
  final _cidadeNatalController = TextEditingController(),
      _estadoController = TextEditingController(),
      _anoConclusaoController = TextEditingController();
  final _nomeMaeController = TextEditingController(),
      _enderecoController = TextEditingController(),
      _cepController = TextEditingController();
  String? _trabalhaAtualmenteSelecionado;
  final _cursoDesejadoController = TextEditingController();
  String? _turnoSelecionado;

  final List<String> _estadosCivis = [
    'Solteiro(a)',
    'Casado(a)',
    'Divorciado(a)',
    'Viúvo(a)',
  ];
  final List<String> _simNao = ['Sim', 'Não'];
  final List<String> _turnos = ['Manhã', 'Tarde', 'Noite'];

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _telefoneController.dispose();
    _cpfController.dispose();
    _rgController.dispose();
    _dataNascimentoController.dispose();
    _cidadeNatalController.dispose();
    _estadoController.dispose();
    _anoConclusaoController.dispose();
    _nomeMaeController.dispose();
    _enderecoController.dispose();
    _cepController.dispose();
    _cursoDesejadoController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      helpText: 'Selecione sua data de nascimento',
      cancelText: 'Cancelar',
      confirmText: 'Selecionar',
    );
    if (picked != null)
      setState(
        () =>
            _dataNascimentoController.text =
                "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}",
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro dos Alunos')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildTextField(
                  label: 'Nome',
                  controller: _nomeController,
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? 'Por favor, digite seu nome.'
                              : null,
                ),
                _verticalSpace(),
                _buildTextField(
                  label: 'Email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? 'Por favor, digite seu email.'
                              : (!value.contains('@')
                                  ? 'Por favor, digite um email válido.'
                                  : null),
                ),
                _verticalSpace(),
                _buildTextField(
                  label: 'Senha',
                  controller: _senhaController,
                  obscureText: true,
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? 'Por favor, digite sua senha.'
                              : (value.length < 6
                                  ? 'A senha deve ter pelo menos 6 caracteres.'
                                  : null),
                ),
                _verticalSpace(),
                _buildTextField(
                  label: 'Telefone',
                  controller: _telefoneController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                _verticalSpace(),
                _buildTextField(
                  label: 'CPF',
                  controller: _cpfController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? 'Por favor, digite seu CPF.'
                              : (value.length != 11 ? 'CPF inválido.' : null),
                ),
                _verticalSpace(),
                _buildTextField(
                  label: 'RG (Opcional)',
                  controller: _rgController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                _verticalSpace(),
                TextFormField(
                  controller: _dataNascimentoController,
                  style: const TextStyle(color: Colors.black),
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  decoration: _inputDecoration(
                    labelText: 'Data de Nascimento',
                    suffixIcon: const Icon(
                      Icons.calendar_today,
                      color: Colors.blueGrey,
                    ),
                  ),
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? 'Por favor, selecione a data de nascimento.'
                              : null,
                ),
                _verticalSpace(),
                _buildDropdownField(
                  label: 'Estado Civil',
                  value: _estadoCivilSelecionado,
                  items: _estadosCivis,
                  onChanged:
                      (newValue) =>
                          setState(() => _estadoCivilSelecionado = newValue),
                  validator:
                      (value) =>
                          value == null
                              ? 'Por favor, selecione o estado civil.'
                              : null,
                ),
                _verticalSpace(),
                _buildTextField(
                  label: 'Cidade Natal',
                  controller: _cidadeNatalController,
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? 'Por favor, digite sua cidade natal.'
                              : null,
                ),
                _verticalSpace(),
                _buildTextField(
                  label: 'Estado (UF)',
                  controller: _estadoController,
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? 'Por favor, digite seu estado.'
                              : (value.length != 2
                                  ? 'Digite a sigla do estado (ex: AL).'
                                  : null),
                ),
                _verticalSpace(),
                _buildTextField(
                  label: 'Ano de Conclusão do Ensino Médio',
                  controller: _anoConclusaoController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? 'Por favor, digite o ano de conclusão.'
                              : (value.length != 4
                                  ? 'Digite um ano válido.'
                                  : null),
                ),
                _verticalSpace(),
                _buildTextField(
                  label: 'Nome da Mãe',
                  controller: _nomeMaeController,
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? 'Por favor, digite o nome da sua mãe.'
                              : null,
                ),
                _verticalSpace(),
                _buildTextField(
                  label: 'Endereço',
                  controller: _enderecoController,
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? 'Por favor, digite seu endereço.'
                              : null,
                ),
                _verticalSpace(),
                _buildTextField(
                  label: 'CEP',
                  controller: _cepController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? 'Por favor, digite seu CEP.'
                              : (value.length != 8 ? 'CEP inválido.' : null),
                ),
                _verticalSpace(),
                _buildDropdownField(
                  label: 'Trabalha Atualmente?',
                  value: _trabalhaAtualmenteSelecionado,
                  items: _simNao,
                  onChanged:
                      (newValue) => setState(
                        () => _trabalhaAtualmenteSelecionado = newValue,
                      ),
                  validator:
                      (value) =>
                          value == null
                              ? 'Por favor, selecione uma opção.'
                              : null,
                ),
                _verticalSpace(),
                _buildTextField(
                  label: 'Curso que Deseja Realizar',
                  controller: _cursoDesejadoController,
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? 'Por favor, digite o curso desejado.'
                              : null,
                ),
                _verticalSpace(),
                _buildDropdownField(
                  label: 'Turno',
                  value: _turnoSelecionado,
                  items: _turnos,
                  onChanged:
                      (newValue) =>
                          setState(() => _turnoSelecionado = newValue),
                  validator:
                      (value) =>
                          value == null
                              ? 'Por favor, selecione o turno.'
                              : null,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print('Nome: ${_nomeController.text}');
                      print('Email: ${_emailController.text}');
                      print('Telefone: ${_telefoneController.text}');
                      print('CPF: ${_cpfController.text}');
                      print('RG: ${_rgController.text}');
                      print(
                        'Data de Nascimento: ${_dataNascimentoController.text}',
                      );
                      print('Estado Civil: $_estadoCivilSelecionado');
                      print('Cidade Natal: ${_cidadeNatalController.text}');
                      print('Estado: ${_estadoController.text}');
                      print(
                        'Ano de Conclusão: ${_anoConclusaoController.text}',
                      );
                      print('Nome da Mãe: ${_nomeMaeController.text}');
                      print('Endereço: ${_enderecoController.text}');
                      print('CEP: ${_cepController.text}');
                      print(
                        'Trabalha Atualmente: $_trabalhaAtualmenteSelecionado',
                      );
                      print('Curso Desejado: ${_cursoDesejadoController.text}');
                      print('Turno: $_turnoSelecionado');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Cadastro realizado com sucesso!'),
                        ),
                      );
                    }
                  },
                  child: const Text('Cadastrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String labelText,
    Widget? suffixIcon,
  }) => InputDecoration(
    labelText: labelText,
    labelStyle: const TextStyle(color: Colors.black54),
    filled: true,
    fillColor: Colors.grey[200],
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.blue),
      borderRadius: BorderRadius.circular(8),
    ),
    suffixIcon: suffixIcon,
  );

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
  }) => TextFormField(
    controller: controller,
    obscureText: obscureText,
    keyboardType: keyboardType,
    inputFormatters: inputFormatters,
    style: const TextStyle(color: Colors.black),
    decoration: _inputDecoration(labelText: label),
    validator: validator,
  );

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    String? Function(String?)? validator,
  }) => DropdownButtonFormField<String>(
    decoration: _inputDecoration(labelText: label),
    value: value,
    isExpanded: true,
    items:
        items
            .map(
              (val) => DropdownMenuItem<String>(
                value: val,
                child: Text(val, style: const TextStyle(color: Colors.black)),
              ),
            )
            .toList(),
    onChanged: onChanged,
    validator: validator,
  );

  Widget _verticalSpace({double height = 16}) => SizedBox(height: height);
}
