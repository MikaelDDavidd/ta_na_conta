import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:ta_na_conta/app/exceptions/app_exceptions.dart';

class ConnectivityService extends GetxService {
  final Connectivity _connectivity = Connectivity();

  /// Retorna `true` se há conexão com a internet, `false` caso contrário.
  Future<bool> isConnected() async {
    // Verifica os tipos de conexão disponíveis
    final List<ConnectivityResult> result = await _connectivity.checkConnectivity();
    final bool hasWifi = result.contains(ConnectivityResult.wifi);
    final bool hasMobile = result.contains(ConnectivityResult.mobile);
    final bool hasEthernet = result.contains(ConnectivityResult.ethernet);
    
    // Se não houver nenhuma dessas conexões, já retorna falso
    if (!(hasWifi || hasMobile || hasEthernet)) {
      return false;
    }

    // Tenta acessar um site para garantir que há internet
    return await _hasInternetAccess();
  }

  /// Testa o acesso à internet tentando pingar o Google
  Future<bool> _hasInternetAccess() async {
    try {
      final List<InternetAddress> result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result.first.rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  /// Método para forçar a verificação de internet e lançar uma exceção caso não haja conexão
  Future<void> requireConnectivity() async {
    if (!await isConnected()) {
      throw const NoInternetException();
    }
  }
}