Candidate.companyName = 'Softinnovas';

Candidate c1 = new Candidate();
c1.name = 'Jerry';
c1.gender = 'Male';
c1.details();


Candidate c2 = new Candidate();
c2.name = 'George';
c2.gender = 'Male';
c2.details();

Candidate c3 = new Candidate();
c3.name = 'Elaine';
c3.gender = 'Female';
c3.details();

Candidate c4 = new Candidate();
c4.name = 'Kramer';
c4.gender = 'Male';
c4.details();

//we cannot access static member via instance
// system.debug('c3 company name is ' + c3.companyName);

system.debug('company name is ' + Candidate.companyName);

Candidate.companyName = 'Salesforce';
system.debug('after change company name is ' + Candidate.companyName);


c1.details();
c2.details();
c3.details();


Candidate.staticDetails();

//track number of candidates created in one execution