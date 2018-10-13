LOAD DATA
INFILE *
INTO TABLE pet
FIELDS TERMINATED BY '|'
TRAILING NULLCOLS
(name, owner, species, sex, birth DATE 'yyyy-mm-dd', death DATE 'yyyy-mm-dd')
BEGINDATA
Fluffy|Harold|cat|f|2008-02-04|
Claws|Gwen|cat|m|2009-03-17|
Buffy|Harold|dog|f|2004-05-13|
Fang|Benny|dog|m|2005-08-27|
Bowser|Diane|dog|m|1994-08-31|2010-07-29
Chirpy|Gwen|bird|f|2012-09-11|
Whistler|Gwen|bird|m|2012-12-09|
Slim|Benny|snake|m|2011-04-29|
