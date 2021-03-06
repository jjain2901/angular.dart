library generated_getter_setter_spec;

import '../../_specs.dart';
import 'parser_spec.dart' as parser_spec;
import 'generated_getter_setter.dart';

main() {
  describe('hybrid getter-setter', () {
    beforeEachModule((Module module) {
      module..type(Parser, implementedBy: DynamicParser)
            ..type(ClosureMap, implementedBy: StaticClosureMap);
    });
    parser_spec.main();
  });
}
