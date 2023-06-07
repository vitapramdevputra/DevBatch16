string cron_str = '13 13 13 * * ?';

AccountSchedulable acs = new AccountSchedulable();
system.schedule('account sch 13 13', cron_str, acs);