library server_mod;

import 'package:pritunl/model.dart' as mdl;
import 'package:pritunl/collections/users.dart' as usrs;

import 'package:angular/angular.dart' show Injectable;
import 'package:angular/angular.dart' as ng;

@Injectable()
class Server extends mdl.Model {
  usrs.Users users;

  @mdl.Attribute('id')
  String id;

  @mdl.Attribute('name')
  String name;

  @mdl.Validator('name')
  void nameValidator(val) {
    if (val == null || val == '') {
      throw new mdl.Invalid('empty', 'Server name cannot be empty');
    }
  }

  @mdl.Attribute('status')
  String status;

  @mdl.Attribute('uptime')
  int uptime;

  @mdl.Attribute('user_count')
  int userCount;

  @mdl.Attribute('users_online')
  int usersOnline;

  @mdl.Attribute('devices_online')
  int devicesOnline;

  @mdl.Attribute('network')
  String network;

  @mdl.Attribute('bind_address')
  String bindAddress;

  @mdl.Attribute('port')
  int port;

  @mdl.Attribute('protocol')
  String protocol;

  @mdl.Attribute('dh_param_bits')
  int dhParamBits;

  @mdl.Attribute('mode')
  String mode;

  @mdl.Attribute('multi_device')
  bool multiDevice;

  @mdl.Attribute('local_networks')
  List<String> localNetworks;

  @mdl.Attribute('dns_servers')
  List<String> dnsServers;

  @mdl.Attribute('search_domain')
  String searchDomain;

  @mdl.Attribute('otp_auth')
  bool otpAuth;

  @mdl.Attribute('cipher')
  String cipher;

  @mdl.Attribute('jumbo_frames')
  bool jumboFrames;

  @mdl.Attribute('lzo_compression')
  bool lzoCompression;

  @mdl.Attribute('debug')
  bool debug;

  Server(ng.Http http) : super(http);

  String get url {
    var url = '/server';

    if (this.id != null) {
      url += '/${this.id}';
    }

    return url;
  }

  String get modeLong {
    if (this.mode == 'all_traffic') {
      return 'All Traffic';
    }
    else if (this.mode == 'local_traffic') {
      return 'Local Traffic Only';
    }
    else if (this.mode == 'vpn_traffic') {
      return 'VPN Traffic Only';
    }
    return 'Unknown';
  }
}