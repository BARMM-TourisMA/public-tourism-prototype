// ignore_for_file: public_member_api_docs, sort_constructors_first

class UploadProgressModel<T> {
    final T data;
    final double progress;
    final String title;
  UploadProgressModel({
    required this.data,
    required this.title,
    required this.progress,
  });

  UploadProgressModel copyWith({
    T? data,
    double? progress,
    String? title,
  }) {
    return UploadProgressModel(
      data: data ?? this.data,
      title: title ?? this.title,
      progress: progress ?? this.progress,
    );
  }

  
  @override
  bool operator ==(covariant UploadProgressModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}
