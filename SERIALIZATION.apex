//Anonymous Window

//  TEK Record SERIALIZATION 
Account acc = [SELECT id, name, phone   FROM account LIMIT 1];
system.debug('Account acc ' + acc);
/*
Account acc Account:{Id=001Dp000003mtzyIAA, Name=deneme accountu iki}
*/
  String jsonAccount= JSON.serialize(acc);
system.debug('JSON.serialize(acc) ::>> ' + JSON.serialize(acc));
/*
JSON.serialize(acc) ::>> 
{"attributes":{"type":"Account","url":"/services/data/v57.0/sobjects/Account/001Dp000003mtzyIAA"},
"Id":"001Dp000003mtzyIAA","Name":"deneme accountu iki"}
*/
//  TEK  Record DESERIALIZATION 
Account gelenAcc =  (Account)JSON.deserialize(jsonAccount, Account.class);
system.debug('(Account)JSON.deserialize(jsonAccount, Account.class) :::>>' + gelenAcc );
/*
JSON.deserialize(jsonAccount, Account.class) :::>>Account:{Id=001Dp000003mtzyIAA, Name=deneme accountu iki}
*/
//  RECORD LISTESI ICIN SERIALIZATION 
List<Account> accList = [SELECT id, name, phone   FROM account LIMIT 3];
//system.debug('List<Account> accList ' + accList);
/*
List<Account> accList (
     Account:{Id=001Dp000003mtzyIAA, Name=deneme accountu iki}, 
     Account:{Id=001Dp000003n3vEIAQ, Name=sarhos accountu olustu}, 
     Account:{Id=001Dp00000FRn8iIAD, Name=Wisequarter}
 )
*/
  String jsonAccountList = JSON.serialize(accList);
system.debug('JSON.serialize(jsonAccountList) ::>> ' + jsonAccountList);
/*
JSON.serialize(jsonAccountList) ::>> 
[
     {"attributes":{"type":"Account","url":"/services/data/v57.0/sobjects/Account/001Dp000003mtzyIAA"},
       "Id":"001Dp000003mtzyIAA","Name":"deneme accountu iki"},
     {"attributes":{"type":"Account","url":"/services/data/v57.0/sobjects/Account/001Dp000003n3vEIAQ"},
     "Id":"001Dp000003n3vEIAQ","Name":&q
     **** 
*/
//  RECORD LISTESI ICIN DESERIALIZATION
List<Account> gelenAccList =  (List<Account>)JSON.deserialize(jsonAccountList, List<Account>.class);
system.debug('(List<Account>)JSON.deserialize(jsonAccountList, List<Account>.class) :::>>' + gelenAccList );
/*
(List<Account>)JSON.deserialize(jsonAccountList, List<Account>.class) :::>>
(
Account:{Id=001Dp000003mtzyIAA, Name=deneme accountu iki}, 
Account:{Id=001Dp000003n3vEIAQ, Name=sarhos accountu olustu}, 
Account:{Id=001Dp00000FRn8iIAD, Name=Wisequarter}
)
*/
