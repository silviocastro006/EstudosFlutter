import 'package:flutter/foundation.dart';
import 'package:primeiro_crud_cadastro_pessoas/model/pessoa.dart';

class Pessoacontroller extends ChangeNotifier{

  List<Pessoa> listaPessoas = [];

  void adicionarPessoa(Pessoa pessoa)
  {
    listaPessoas.add(pessoa);

    notifyListeners();
  }

  void editarPessoa(int index, Pessoa novaPessoa) {
    if (index >= 0 && index < listaPessoas.length) {
      listaPessoas[index] = novaPessoa;
      notifyListeners();
    }
  }

  void excluirPessoa(int index)
  {
    if (index >= 0 && index < listaPessoas.length) {
      listaPessoas.removeAt(index);
      notifyListeners();
    }
  }

  List<Pessoa> listarPessoas() {
    return listaPessoas;
  }

  void ExcluirTodasPessoas(){
    listaPessoas.clear();
    notifyListeners();
  }

}