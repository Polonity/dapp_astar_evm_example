import 'package:dapp_astar_evm_example/viewModels/components/dapps_view_model_abstract.dart';

/// dapps example provider
class DAppExampleViewModel extends DAppViewModelAbstract {
  DAppExampleViewModel(
      {required chainID,
      required String rpcUrl,
      required List<String> abi,
      required String contractAddress})
      : super(
            chainID: chainID,
            rpcUrl: rpcUrl,
            abi: abi,
            contractAddress: contractAddress);

  /// counter value
  int? _counter;
  String get counter => (_counter == null) ? "???" : _counter.toString();

  /// for progress indicator
  bool _inProgress = false;

  /// getter for progress indicator
  bool get inProgress => _inProgress;

  /// setter for progress indicator
  set inProgress(bool _val) {
    _inProgress = _val;
  }

  /// call increment contract and sync incremented value
  Future<void> increment() async {
    inProgress = true;
    notifyListeners();

    /// send tx
    final tx = await contractIface!.send('increment');

    /// wait for processing tx
    await tx.wait();

    /// get incremented value
    await sync();

    inProgress = false;
    notifyListeners();
  }

  /// sync incremented value
  @override
  Future<void> sync() async {
    /// get incremented value
    _counter = (await contractIface!.call<BigInt>('get')).toInt();
    notifyListeners();
  }
}
