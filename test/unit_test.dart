// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dapp_astar_evm_example/viewModels/dapp_example_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test', () {
    final chainID = 1;
    final rpcUrl = "rpcUrl";
    final abi = ["abi"];
    final contractAddress = "contractAddress";

    DAppExampleViewModel _dAppExampleViewModel = DAppExampleViewModel(
        chainID: chainID,
        rpcUrl: rpcUrl,
        abi: abi,
        contractAddress: contractAddress);
    expect(_dAppExampleViewModel.chainID, chainID);
    expect(_dAppExampleViewModel.rpcUrl, rpcUrl);
    expect(_dAppExampleViewModel.abi, abi);
    expect(_dAppExampleViewModel.contractAddress, contractAddress);
  });
}
