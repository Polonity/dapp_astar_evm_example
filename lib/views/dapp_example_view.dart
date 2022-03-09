import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:dapp_astar_evm_example/viewModels/dapp_example_view_model.dart';
import 'package:provider/src/provider.dart';

class DAppExampleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Flutter Demo Home Page'),
              _connectionStatus(context)
            ]),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(context
                .select((DAppExampleViewModel _model) => _model.counter)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (context.select(
                    (DAppExampleViewModel _model) => _model.isConnected) &&
                context.select((DAppExampleViewModel _model) =>
                    _model.isInOperatingChain) &&
                !context
                    .select((DAppExampleViewModel _model) => _model.inProgress))
            ? context.read<DAppExampleViewModel>().increment
            : null,
        tooltip: 'Increment',
        child:
            (context.select((DAppExampleViewModel _model) => _model.inProgress))
                ? const CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.white,
                  )
                : const Icon(Icons.add),
      ),
    );
  }

  Widget _connectionStatus(BuildContext context) {
    String _text = 'Connect';
    bool _isActive = true;
    List<Color> _buttonColor = [Colors.red[900]!, Colors.orange[600]!];
    if (context.select((DAppExampleViewModel _model) => _model.isConnected) &&
        context.select(
            (DAppExampleViewModel _model) => _model.isInOperatingChain)) {
      _text = context
          .select((DAppExampleViewModel _model) => _model.currentAddress);
      _isActive = false;
      _buttonColor = [
        const Color.fromARGB(255, 146, 253, 173),
        const Color.fromARGB(255, 144, 212, 252)
      ];
      // context.read<DAppExampleViewModel>().sync();
    } else if (context
            .select((DAppExampleViewModel _model) => _model.isConnected) &&
        !context.select(
            (DAppExampleViewModel _model) => _model.isInOperatingChain)) {
      _text = 'Wrong chain';
      _buttonColor = [Colors.red[900]!, Colors.orange[600]!];
    } else if (Ethereum.isSupported) {
      _text = 'Connect';
      _buttonColor = [
        const Color.fromARGB(255, 4, 0, 255),
        const Color.fromARGB(255, 45, 129, 255)
      ];
    } else {
      _text = 'Not supported';
      _buttonColor = [Colors.red[900]!, Colors.orange[600]!];
    }

    return Container(
      margin: const EdgeInsets.all(30),
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: LinearGradient(
          colors: _buttonColor,
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight,
        ),
      ),
      child: TextButton(
        child: Text(
          _text,
          style: const TextStyle(color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
        onPressed: (!_isActive)
            ? null
            : context.read<DAppExampleViewModel>().connectProvider,
      ),
    );
  }
}
