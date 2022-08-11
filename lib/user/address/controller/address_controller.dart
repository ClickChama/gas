import 'package:gas/pages/models/adress.dart';
import 'package:gas/user/address/address_result/address_result.dart';
import 'package:gas/user/address/repository/address_repository.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  final addressRepository = AddressRepository();

  List<AdressModel> addressItems = [];

  @override
  void onInit() {
    super.onInit();
    getAddress();
  }

  String addressName() {
    String name = '';
    for (final item in addressItems) {
      name += item.address ?? 'Sem endereço';
    }
    return name;
  }

  String addressNumber() {
    String number = '';
    for (final item in addressItems) {
      number += item.number ?? '';
    }
    return number;
  }

  String addressComplement() {
    String name = '';
    for (final item in addressItems) {
      name += item.complement ?? '';
    }
    return name;
  }

  String addressDistric() {
    String name = '';
    for (final item in addressItems) {
      name += item.district ?? '';
    }
    return name;
  }

  String addressCity() {
    String name = '';
    for (final item in addressItems) {
      name += item.city ?? '';
    }
    return name;
  }

  String addressState() {
    String name = '';
    for (final item in addressItems) {
      name += item.state ?? '';
    }
    return name;
  }

  String addressCep() {
    String name = '';
    for (final item in addressItems) {
      name += item.zipCode ?? '';
    }
    return name;
  }

  Future<void> getAddress() async {
    final AddressResult<List<AdressModel>> result = await addressRepository.getAddress();
    result.when(success: (data) {
      addressItems = data;

      update();
    }, error: (message) {
      print('erro');
    });
  }

  Future<void> storeAddress(
    address,
    number,
    complement,
    district,
    city,
    state,
    zipCode,
  ) async {
    final AddressResult<List<AdressModel>> result = await addressRepository.storeAddress(
      address,
      number,
      complement,
      district,
      city,
      state,
      zipCode,
    );
    result.when(success: (data) {
      addressItems = data;
   
    }, error: (message) {
      print('erro');
    });
    update();
  }
}
