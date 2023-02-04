class Biller {
    Biller({
        this.id,
        this.name,
        this.cyberPayBillerCategoryId,
        this.billerCode,
        this.logoUrl,
    });

    int? id;
    String? name;
    int? cyberPayBillerCategoryId;
    String? billerCode;
    String? logoUrl;

    factory Biller.fromJson(Map<String, dynamic> json) => Biller(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        cyberPayBillerCategoryId: json["cyberPayBillerCategoryId"] == null ? null : json["cyberPayBillerCategoryId"],
        billerCode: json["billerCode"] == null ? null : json["billerCode"],
        logoUrl: json["logoUrl"] == null ? null : json["logoUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "cyberPayBillerCategoryId": cyberPayBillerCategoryId == null ? null : cyberPayBillerCategoryId,
        "billerCode": billerCode == null ? null : billerCode,
        "logoUrl": logoUrl == null ? null : logoUrl,
    };
}
