import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:snake/database/drift/drift_score.dart';

part 'rest_client.g.dart';

const _baseUrl = "https://629ccb5be9358232f760b7b4.mockapi.io";

@RestApi(baseUrl: _baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/score")
  Future<List<Score>> getScores();

  @GET("/score/{id}")
  Future<Score> getScore(@Path("id") String id);

  @POST("/score")
  Future postScore(@Body() Score score);

  @PUT("/score/{id}")
  Future putScore(@Path("id") String id, @Body() Score score);

  @DELETE("/score/{id}")
  Future deleteScore(@Path("id") String id);
}
