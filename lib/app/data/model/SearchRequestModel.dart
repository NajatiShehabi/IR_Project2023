
class SearchRequestModel {
    String query;

    SearchRequestModel({required this.query});

    factory SearchRequestModel.fromJson(Map<String, dynamic> json) {
        return SearchRequestModel(
            query: json['query'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['query'] = query;
        return data;
    }
}