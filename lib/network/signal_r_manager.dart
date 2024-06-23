// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:http/io_client.dart';
// import 'package:kadad/local_storage/shared_preferences_manager.dart';
// import 'package:signalr_core/signalr_core.dart';
//
//
// class SignalRManager {
//   HubConnection? hubConnection;
//
//   Future<String?> getToken() async {
//     final accessToken = PrefsManager.getData(key: "token") ?? "";
//     debugPrint("RPC token: $accessToken");
//     return accessToken;
//   }
//
//   Future<void> initSignalR({
//     required String serverURL,
//     required String methodName,
//     required dynamic handleNewData,
//     List<dynamic>? handleInvoke,
//      String ?invokeMethodName,
//   }) async {
//     hubConnection = HubConnectionBuilder()
//         .withUrl(
//       serverURL,
//       HttpConnectionOptions(
//         client:
//             IOClient(HttpClient()..badCertificateCallback = (x, y, z) => true),
//         logging: (level, message) => debugPrint(message),
//         accessTokenFactory: getToken,
//       ),
//     )
//         .withAutomaticReconnect([500, 1000, 2000, 3000]).build();
//     hubConnection?.onclose((exception) {
//       debugPrint("connection close  $exception");
//       hubConnection!.stop();
//     });
//     if (hubConnection!.state == HubConnectionState.disconnected) {
//       hubConnection!.on(methodName, handleNewData);
//       await hubConnection!.start();
//       await hubConnection!.invoke(invokeMethodName!, args: handleInvoke);
//     }
//   }
//
//   Future<void> invokeSignalR({
//     List<dynamic>? handleInvoke,
//     required String invokeMethodName,
//   }) async {
//     await hubConnection!.invoke(invokeMethodName, args: handleInvoke);
//   }
//
//   Future<void> closeConnection() async {
//     if (hubConnection != null ||
//         hubConnection!.state == HubConnectionState.connected) {
//       await hubConnection!.stop();
//     }
//   }
// }
