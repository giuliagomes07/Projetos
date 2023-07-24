import 'package:atividade1/widgets/task_app_widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Check if is the right instance', () {
    const tarefaApp = TarefaApp();

    expect(tarefaApp, isInstanceOf<TarefaApp>());
  });
}
