import 'package:flutter_riverpod/flutter_riverpod.dart';

final commentProvider =
    StateNotifierProvider.autoDispose<comments, List<Map<String, dynamic>>>(
        (ref) => comments());

class comments extends StateNotifier<List<Map<String, dynamic>>> {
  comments() : super([]);

  void setValue(List<Map<String, dynamic>> val) {
    state = [...val];
  }

  void addAtFist(Map<String, dynamic> val) {
    state = [val, ...state];
  }

  void deleteComment(String cid) {
    List<Map<String, dynamic>> val = [];
    state.removeWhere((element) => element['cid'] == cid);
    val = state;
    state = [...val];
  }
}

final isLoading = StateProvider((ref) => false);
