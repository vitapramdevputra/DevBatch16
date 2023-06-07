MapDemo2.mapItemPrices();




Map<string, integer> map2 = new map<string, integer>();
map2.put('one', 101);
map2.put('two', 202);
map2.put('three', 303);

//get all keys from map -> we use KEYSET method


integer i1 = map2.get('one');//101
integer i2 = map2.get('two');//202
integer i3 = map2.get('three');//303

set<string> allKeys = map2.keySet();
system.debug('all keys ' + allKeys);
//{one, three, two}

for(string eKey : allKeys){
    //loop will execute three times
        //1. ekey => one
            //map2.get(ekey) ==> map2.get('one');
        //2. ekey => two
        //3. ekey => three
    system.debug('key is ' + eKey);
    integer i = map2.get(ekey);
    system.debug('value is ' + i);
        //1. i => 101
        //2. i => 202
        //3. i => 303
}


