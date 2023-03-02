class BillerPaymentItems {
    BillerPaymentItems({
       required   this.id,
        required  this.name,
        required  this.itemCode,
        required  this.commission,
        required  this.cyberPayBillerId,
        required  this.amount,
        required  this.fee,
        required  this.commissionType,
        required  this.commissionSource,
        required  this.isCapped,
        required  this.cap,
        required  this.shouldVerifyCustomer,
    });

    int id;
    String name;
    String itemCode;
    double commission;
    int cyberPayBillerId;
    String amount;
    double fee; //!FEE IS IN NAIRA
    String commissionType;
    String commissionSource;
    bool isCapped;
    double cap;
    bool shouldVerifyCustomer;
    factory BillerPaymentItems.fromJson(Map<String, dynamic> json) => BillerPaymentItems(
        id: json["id"],
        name: json["name"],
        itemCode: json["itemCode"],
        commission: json["commission"] ?? json["commission"].toDouble(),
        cyberPayBillerId: json["cyberPayBillerId"] ?? json["cyberPayBillerId"],
        amount: json["amount"] ?? json["amount"],
        fee: json["fee"] ?? json["fee"],
        commissionType: json["commissionType"] ?? json["commissionType"],
        commissionSource: json["commissionSource"] ?? json["commissionSource"],
        isCapped: json["isCapped"] ?? json["isCapped"],
        cap: json["cap"] ?? json["cap"],
        shouldVerifyCustomer: json["shouldVerifyCustomer"] ?? json["shouldVerifyCustomer"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "itemCode": itemCode ?? itemCode,
        "commission": commission,
        "cyberPayBillerId": cyberPayBillerId,
        "amount": amount,
        "fee": fee,
        "commissionType": commissionType,
        "commissionSource": commissionSource,
        "isCapped": isCapped,
        "cap": cap ,
        "shouldVerifyCustomer": shouldVerifyCustomer,
    };
}