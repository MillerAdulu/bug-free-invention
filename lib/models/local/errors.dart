part of holiday_local_models;


class Failure implements Exception {
  Failure({
    required this.message,
  });

  final String message;

  factory Failure.fromGraphQL(List<GQL.GraphQLError> errors) {
    List<String> messages = [];

    for (GQL.GraphQLError error in errors) {
      messages.add(error.message);
    }

    return Failure(
      message: messages.toString().replaceAll('[', '').replaceAll(']', ''),
    );
  }
}
