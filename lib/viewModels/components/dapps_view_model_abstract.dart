import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';

/// dapps view model abstract
///
///
abstract class DAppViewModelAbstract extends ChangeNotifier {
  /// RPC URL for chain
  final String rpcUrl;

  /// chain ID
  // ignore: prefer_typing_uninitialized_variables
  final chainID;

  /// network name(option)
  final String networkName;

  final String contractAddress;

  final List<String> abi;

  DAppViewModelAbstract(
      {required this.chainID,
      required this.rpcUrl,
      required this.abi,
      required this.contractAddress,
      this.networkName = ""});

  /// wallet status
  Web3Provider? web3wc;

  late WalletConnectProvider wc = WalletConnectProvider.fromRpc(
    {chainID: rpcUrl},
    chainId: chainID,
    network: networkName,
  );

  /// chain infomations
  bool get isInOperatingChain => currentChain == chainID;
  bool get isConnected => Ethereum.isSupported && currentAddress.isNotEmpty;
  bool wcConnected = false;
  String currentAddress = "";
  int currentChain = -1;

  /// for contracts call
  Contract? contractIface;

  init() {
    if (Ethereum.isSupported) {
      connectProvider();

      ethereum!.onAccountsChanged((accs) {
        clear();
      });

      ethereum!.onChainChanged((chain) {
        clear();
      });
    }

    contractIface = Contract(
      contractAddress,
      Interface(abi),
      provider!.getSigner(),
    );
  }

  Future<void> sync() async {}

  connectProvider() async {
    if (Ethereum.isSupported) {
      final accs = await ethereum!.requestAccount();
      if (accs.isNotEmpty) {
        currentAddress = accs.first;
        currentChain = await ethereum!.getChainId();
        sync();
      }

      notifyListeners();
    }
  }

  connectWC() async {
    await wc.connect();
    if (wc.connected) {
      currentAddress = wc.accounts.first;
      currentChain = chainID;
      wcConnected = true;
      web3wc = Web3Provider.fromWalletConnect(wc);
    }

    notifyListeners();
  }

  clear() {
    currentAddress = '';
    currentChain = -1;
    wcConnected = false;
    web3wc = null;

    notifyListeners();
  }
}
