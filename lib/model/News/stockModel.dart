/// symbol : "sz300945"
/// code : "300945"
/// name : "N曼卡龙"
/// trade : "21.920"
/// pricechange : 17.36
/// changepercent : 380.702
/// buy : "21.920"
/// sell : "21.930"
/// settlement : "4.560"
/// open : "23.000"
/// high : "29.800"
/// low : "20.000"
/// volume : 32765924
/// amount : 766678154
/// ticktime : "16:29:00"
/// per : 52.19
/// pb : 6.322
/// mktcap : 447168
/// nmc : 106020.034368
/// turnoverratio : 67.74465

class StockModel {
  String _symbol;
  String _code;
  String _name;
  String _trade;
  dynamic _pricechange;
  dynamic _changepercent;
  String _buy;
  String _sell;
  String _settlement;
  String _open;
  String _high;
  String _low;
  dynamic _volume;
  dynamic _amount;
  String _ticktime;
  dynamic _per;
  dynamic _pb;
  dynamic _mktcap;
  dynamic _nmc;
  dynamic _turnoverratio;

  String get symbol => _symbol;
  String get code => _code;
  String get name => _name;
  String get trade => _trade;
  dynamic get pricechange => _pricechange;
  dynamic get changepercent => _changepercent;
  String get buy => _buy;
  String get sell => _sell;
  String get settlement => _settlement;
  String get open => _open;
  String get high => _high;
  String get low => _low;
  dynamic get volume => _volume;
  dynamic get amount => _amount;
  String get ticktime => _ticktime;
  dynamic get per => _per;
  dynamic get pb => _pb;
  dynamic get mktcap => _mktcap;
  dynamic get nmc => _nmc;
  dynamic get turnoverratio => _turnoverratio;

  StockModel({
      String symbol, 
      String code, 
      String name, 
      String trade,
      dynamic pricechange,
      dynamic changepercent,
      String buy, 
      String sell, 
      String settlement, 
      String open, 
      String high, 
      String low, 
      dynamic volume,
      dynamic amount,
      String ticktime, 
      dynamic per,
      dynamic pb,
      dynamic mktcap,
      dynamic nmc,
      dynamic turnoverratio}){
    _symbol = symbol;
    _code = code;
    _name = name;
    _trade = trade;
    _pricechange = pricechange;
    _changepercent = changepercent;
    _buy = buy;
    _sell = sell;
    _settlement = settlement;
    _open = open;
    _high = high;
    _low = low;
    _volume = volume;
    _amount = amount;
    _ticktime = ticktime;
    _per = per;
    _pb = pb;
    _mktcap = mktcap;
    _nmc = nmc;
    _turnoverratio = turnoverratio;
}

  StockModel.fromJson(dynamic json) {
    _symbol = json["symbol"];
    _code = json["code"];
    _name = json["name"];
    _trade = json["trade"];
    _pricechange = json["pricechange"];
    _changepercent = json["changepercent"];
    _buy = json["buy"];
    _sell = json["sell"];
    _settlement = json["settlement"];
    _open = json["open"];
    _high = json["high"];
    _low = json["low"];
    _volume = json["volume"];
    _amount = json["amount"];
    _ticktime = json["ticktime"];
    _per = json["per"];
    _pb = json["pb"];
    _mktcap = json["mktcap"];
    _nmc = json["nmc"];
    _turnoverratio = json["turnoverratio"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["symbol"] = _symbol;
    map["code"] = _code;
    map["name"] = _name;
    map["trade"] = _trade;
    map["pricechange"] = _pricechange;
    map["changepercent"] = _changepercent;
    map["buy"] = _buy;
    map["sell"] = _sell;
    map["settlement"] = _settlement;
    map["open"] = _open;
    map["high"] = _high;
    map["low"] = _low;
    map["volume"] = _volume;
    map["amount"] = _amount;
    map["ticktime"] = _ticktime;
    map["per"] = _per;
    map["pb"] = _pb;
    map["mktcap"] = _mktcap;
    map["nmc"] = _nmc;
    map["turnoverratio"] = _turnoverratio;
    return map;
  }

}