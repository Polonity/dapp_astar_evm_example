import 'package:dapp_astar_evm_example/configs/config.dart';
import 'package:flutter/material.dart';
import 'package:dapp_astar_evm_example/views/dapp_example_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

// -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
// for provide data
// -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
import 'package:dapp_astar_evm_example/viewModels/dapp_example_view_model.dart';

void main() async {
  // portrait only up
  WidgetsFlutterBinding.ensureInitialized();

  DAppExampleViewModel _dAppExampleViewModel = DAppExampleViewModel(
      chainID: chainID,
      rpcUrl: rpcUrl,
      abi: abi,
      contractAddress: contractAddress);

  _dAppExampleViewModel.init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => _dAppExampleViewModel),
    ], child: MyDapp()));
  });
}

class MyDapp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DAppExampleView(),
    );
  }
}
