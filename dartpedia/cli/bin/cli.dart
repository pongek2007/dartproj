
import 'package:command_runner/command_runner.dart';

const version = '0.0.1';

void main(List<String> arguments) async {
  
  // [Step 6 update] Add onError method

  var commandRunner = CommandRunner(
    onOutput: (Object output) async {
      await write(output.toString());
    },

    onError : (Object error) {
      if (error is Error) {
        throw error;
      }
      if (error is Exception) {
        print(error);
      }
    },
  )..addCommand(HelpCommand());
  await commandRunner.run(arguments);
}

