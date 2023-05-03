//Anonymous Window

//------------1 ACC-----------------

Account acc = [SELECT id, name, phone FROM Account LIMIT 1];

System.debug('Account::>'+ acc);

//SERIALIZATION
String jsonAccount = JSON.serialize(acc);

System.debug('JSON.serialize(acc) ::>> '+ JSON.serialize(acc));

//DESERIALIZATION
Account jsonToAcc = (Account)JSON.deserialize(jsonAccount, Account.class);
System.debug('jsonToAcc ::>>' + jsonToAcc);

//------------ACC LIST-------------

List<Account> accList = [SELECT id, name, phone FROM Account LIMIT 3];

System.debug('List<Account>::>'+ accList);

//SERIALIZATION
String jsonAccountList = JSON.serialize(accList);

System.debug('JSON.serialize(jsonAccountList) ::>> '+ jsonAccountList);

//DESERIALIZATION
List<Account> jsonToAccList = (List<Account>)JSON.deserialize(jsonAccountList, List<Account>.class);
System.debug('jsonToAccList ::>>' + jsonToAccList);
