

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'cyber_pay_api.g.dart';


@RestApi()
abstract class  CyberPayApi{

   factory  CyberPayApi(Dio dio) = _CyberPayApi;


}