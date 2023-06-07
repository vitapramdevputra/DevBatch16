RankHandler rh = new RankHandler();
string p1 = rh.rankPrize(1);
system.debug('1 => ' + p1);
string p2 = rh.rankPrize(2);
system.debug('2 => ' + p2);
string p3 = rh.rankPrize(3);
system.debug('3 => ' + p3);
string p5 = rh.rankPrize(5);
system.debug('5 => ' + p5);
string p13 = rh.rankPrize(13);
system.debug('13 => ' + p13);



RankHandler rh2 = new RankHandler();
string ps1 = rh2.rankPrizeSwitch(1);
system.debug('1 => ' + ps1);
string ps2 = rh2.rankPrizeSwitch(2);
system.debug('2 => ' + ps2);
string ps3 = rh2.rankPrizeSwitch(3);
system.debug('3 => ' + ps3);
string ps5 = rh2.rankPrizeSwitch(5);
system.debug('5 => ' + ps5);
string ps13 = rh2.rankPrizeSwitch(13);
system.debug('13 => ' + ps13);