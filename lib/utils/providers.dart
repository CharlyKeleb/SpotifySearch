import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';
import 'package:spotify/view_model/search_view_model.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => SearchViewModel()),
];
