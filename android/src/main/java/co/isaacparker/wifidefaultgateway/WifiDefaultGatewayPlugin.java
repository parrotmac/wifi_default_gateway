package co.isaacparker.wifidefaultgateway;

import android.app.Activity;
import android.content.Context;
import android.net.*;
import android.net.wifi.WifiManager;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * WifiDefaultGatewayPlugin
 */
public class WifiDefaultGatewayPlugin implements MethodCallHandler {
  private Activity activity;

  WifiDefaultGatewayPlugin(Activity activity) {
    this.activity = activity;
  }

  /**
   * Plugin registration.
   */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "isaacparker.co/wifi_default_gateway");
    channel.setMethodCallHandler(new WifiDefaultGatewayPlugin(registrar.activity()));
  }

  public String getDefaultGatewayIP() {
    WifiManager wifiManager = (WifiManager) this.activity.getSystemService(Context.WIFI_SERVICE);
    DhcpInfo dhcpInfo=wifiManager.getDhcpInfo();
    int gatewayIPInt = dhcpInfo.gateway;
    String gatewayIP = String.format(
      "%d.%d.%d.%d",
      ((gatewayIPInt) & 0xFF),
      ((gatewayIPInt >> 8 ) & 0xFF),
      ((gatewayIPInt >> 16) & 0xFF),
      ((gatewayIPInt >> 24) & 0xFF)
    );
    return gatewayIP;
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if(call.method.equals("getGatewayIP")) {
      result.success(getDefaultGatewayIP());
    } else {
      result.notImplemented();
    }
  }
}
