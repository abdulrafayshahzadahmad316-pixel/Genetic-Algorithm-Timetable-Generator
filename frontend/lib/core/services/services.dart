import 'api_client.dart';
import 'dashboard_repository.dart';

abstract final class Services {
  static final ApiClient api = ApiClient();
  static final DashboardRepository dashboard = DashboardRepository(api);
}
