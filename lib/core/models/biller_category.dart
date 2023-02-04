class BillerCategory {
    BillerCategory({
        required    this.id,
        required   this.name,
    });

    int id;
    String name;

    factory BillerCategory.fromJson(Map<String, dynamic> json) => BillerCategory(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
    };
}
