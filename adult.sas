/* ----------------------------------------------------------------------------
 
   The National Health Interview Survey (NHIS) 2021;
 
                 Sample Adult data file
 
    This program loads the NHIS sample adult ASCII data file downloaded from the
    NCHS website (https://www.cdc.gov/nchs/nhis/index.htm) to a SAS dataset.
    The program creates descriptive variable labels and formats with meaningful
    category labels. It sets the variable lengths and uses input statements to
    read in the data. It ends with some sample proc freq calls to verify that
    the data were correctly loaded.
 
    Before running this program, please:
    - Download the sample adult ASCII file to a folder called C:\NHIS2021
      (on a machine running Windows)
    - Configure the macro variables 'nhisfolder', 'adultds' and 'formatcat' below.
      These variables set: the local folder where the ASCII file is located and
      where the SAS dataset will be saved, the name of the sample adult dataset,
      and the name of the catalog where formats are to be saved, respectively.
*/

/* 
    To prevent format associations from being stored with data set, when running the 
    'SAS input statements,' either put an asterisk(*) before the word "format"
    in the section of the program for 'format associations,' [scroll about 3/4 of the way
    down the program] or, add "FORMAT _ALL_;" in the frequency procedure to see the values
    of the variables without their value label.
*/

/* 
    Path to the folder where the NHIS ASCII file is located. Also where the
    permanent SAS dataset will be stored
*/
%let nhisfolder=c:\nhis2021;
/* name of the dataset to load into */
%let adultds=adult21;
/* formats are stored temporarily in catalog in WORK.formats */
%let formatcat=WORK.formats;

/* --- DO NOT EDIT BELOW THIS LINE --- */
libname NHIS "&nhisfolder";
filename ASCIIDAT "&nhisfolder\adult21.dat";
 
/* formats for variables */
proc format library=&formatcat;
 
    VALUE SA001X
         00               = "00 0"
         1-9              = "1-9"
         10               = "10 10+"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA002X
         1-84             = "1-84 years"
         85               = "85 85+ years"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA003X
         18-84            = "18-84 years"
         85               = "85 85+ years"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA004X
         20               = "20 years or younger"
         21-84            = "21-84 years"
         85               = "85 85+ years"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA005X
         18               = "18 years or younger"
         19-84            = "19-84 years"
         85               = "85 85+ years"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA006X
         59-76            = "59-76 inches"
         96               = "96 Not available"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA007X
         1                = "1 Underweight"
         2                = "2 Healthy weight"
         3                = "3 Overweight"
         4                = "4 Obese"
         9                = "9 Unknown"
    ;
 
    VALUE SA008X
         1                = "1 Reassigned to CHIP from private"
    ;
 
    VALUE SA009X
         1                = "1 Yes, a citizen of the United States"
         2                = "2 No, not a citizen of the United States"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA010X
         1                = "1 Private"
         2                = "2 Medicaid and other public"
         3                = "3 Other coverage"
         4                = "4 Uninsured"
         5                = "5 Don't Know"
    ;
 
    VALUE SA011X
         1                = "1 Private"
         2                = "2 Dual eligible"
         3                = "3 Medicare Advantage"
         4                = "4 Medicare only excluding Medicare Advantage"
         5                = "5 Other coverage"
         6                = "6 Uninsured"
         7                = "7 Don't Know"
    ;
 
    VALUE SA012X
         0-129            = "0-129 days"
         130              = "130 130+ days"
         997              = "997 Refused"
         998              = "998 Not Ascertained"
         999              = "999 Don't Know"
    ;
 
    VALUE SA013X
         00               = "00 0 days"
         1-9              = "1-9 days"
         10               = "10 10+ days"
         91               = "91 Did not work"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA014X
         1                = "1"
         2                = "2"
         3                = "3"
         4                = "4"
         5                = "5 or more"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA015X
         00               = "00 Within past year"
         1-84             = "1-84 years"
         96               = "96 Age 85+ and diagnosed at age 85+"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA016X
         1                = "1 Current e-cigarette user"
         2                = "2 Used e-cigarette, not current user"
         3                = "3 Never e-cigarette user"
         4                = "4 E-cigarette user, current status unknown"
         9                = "9 Unknown if ever used e-cigarette"
    ;
 
    VALUE SA017X
         01               = "01 Grade 0-11"
         02               = "02 12th grade, no diploma"
         03               = "03 GED or equivalent"
         04               = "04 High School Graduate"
         05               = "05 Some college, no degree"
         06               = "06 Associate degree: occupational, technical, or vocational program"
         07               = "07 Associate degree: academic program"
         08               = "08 Bachelor's degree (Example: BA, AB, BS, BBA)"
         09               = "09 Master's degree (Example: MA, MS, MEng, MEd, MBA)"
         10               = "10 Professional School or Doctoral degree (Example: MD, DDS, DVM, JD, PhD, EdD)"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA018X
         0                = "0 times"
         1                = "1 time"
         2                = "2 times"
         3                = "3 times"
         4                = "4 4+ times"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA019X
         1-94             = "1-94 hours"
         95               = "95 95+ hours"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA020X
         1                = "1 Exchange plan"
         2                = "2 Not exchange plan"
         8                = "8 Not Ascertained"
    ;
 
    VALUE SA021X
         1                = "1 Company provides exchange plans"
         2                = "2 Not an exchange company"
         3                = "3 Exchange Portal or exact exchange plan name"
         8                = "8 Not Ascertained"
    ;
 
    VALUE SA022X
         1                = "1 Food secure"
         2                = "2 Low food security"
         3                = "3 Very low food security"
         8                = "8 Not Ascertained"
    ;
 
    VALUE SA023X
         1                = "1 High food security"
         2                = "2 Marginal food security"
         3                = "3 Low food security"
         4                = "4 Very low food security"
         8                = "8 Not Ascertained"
    ;
 
    VALUE SA024X
         1                = "1 Person is sample adult"
    ;
 
    VALUE SA025X
         1-39999          = "$1 - $39,999"
         40000            = "40000 $40,000 or more"
         99997            = "99997 Refused"
         99998            = "99998 Not Ascertained"
         99999            = "99999 Don't Know"
    ;
 
    VALUE SA026X
         1                = "1 Hispanic (Mexican/Mexican American)"
         2                = "2 Hispanic (all other groups)"
         3                = "3 Not Hispanic"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA027X
         01               = "01 Hispanic"
         02               = "02 Non-Hispanic White only"
         03               = "03 Non-Hispanic Black/African American only"
         04               = "04 Non-Hispanic Asian only"
         05               = "05 Non-Hispanic AIAN only"
         06               = "06 Non-Hispanic AIAN and any other group"
         07               = "07 Other single and multiple races"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE $SA028X
         '0'              = "'0' Income reported"
         '1'              = "'1' Income imputed; no other information"
         '2'              = "'2' Income imputed; reported in income brackets"
         'Blank'          = "'Blank' No Sample Adult or Sample Child in household"
    ;
 
    VALUE SA029X
         1                = "1 Yes, information"
         2                = "2 Yes, but no information"
         3                = "3 No"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA030X
         01               = "01 January"
         02               = "02 February"
         03               = "03 March"
         04               = "04 April"
         05               = "05 May"
         06               = "06 June"
         07               = "07 July"
         08               = "08 August"
         09               = "09 September"
         10               = "10 October"
         11               = "11 November"
         12               = "12 December"
    ;
 
    VALUE SA031X
         1                = "1 Quarter 1"
         2                = "2 Quarter 2"
         3                = "3 Quarter 3"
         4                = "4 Quarter 4"
    ;
 
    VALUE SA032X
         1                = "1 Experienced serious psychological distress"
         2                = "2 Did not experience serious psychological distress"
         8                = "8 Not ascertained"
    ;
 
    VALUE SA033X
         100-299          = "100-299 pounds"
         996              = "996 Not available"
         997              = "997 Refused"
         998              = "998 Not Ascertained"
         999              = "999 Don't Know"
    ;
 
    VALUE SA034X
         1                = "1 Separated"
         2                = "2 Divorced"
         3                = "3 Married"
         4                = "4 Single/never married"
         5                = "5 Widowed"
         9                = "9 Unknown legal marital status"
    ;
 
    VALUE SA035X
         1                = "1 Reassigned to Medicaid from private"
    ;
 
    VALUE SA036X
         1                = "1 Married, spouse is present"
         2                = "2 Married, spouse is not present"
         3                = "3 Married, spouse presence unknown"
         4                = "4 Widowed"
         5                = "5 Divorced"
         6                = "6 Separated"
         7                = "7 Never married"
         8                = "8 Living with a partner"
         9                = "9 Unknown marital status"
    ;
 
    VALUE SA037X
         1                = "1 Medicare Advantage"
         2                = "2 Private plan not Medicare Advantage"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA038X
         1                = "1 Mentioned"
         2                = "2 Not mentioned"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA039X
         1                = "1 Multiple families in household"
         2                = "2 Only one family in household"
         9                = "9 Unknown"
    ;
 
    VALUE SA040X
         0                = "0 None"
         1                = "1 or more"
    ;
 
    VALUE SA041X
         1                = "1 Not covered"
         2                = "2 Covered"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA042X
         1                = "1 Reassigned to other government from private"
    ;
 
    VALUE SA043X
         1                = "1 Reassigned to other public from private"
    ;
 
    VALUE SA044X
         1                = "1 Yes, the sample adult is a parent of a child residing in the family"
         2                = "2 There are minor children residing in family but sample adult is not their parent"
         3                = "3 There are no minor children residing in the family"
         9                = "9 Unknown"
    ;
 
    VALUE SA045X
         0                = "0 adults"
         1                = "1 adult"
         2                = "2 adults"
         3                = "3 3+ adults"
         8                = "8 Not Ascertained"
    ;
 
    VALUE SA046X
         1                = "1 adult"
         2                = "2 adults"
         3                = "3 3+ adults"
         8                = "8 Not Ascertained"
    ;
 
    VALUE SA047X
         0                = "0 children"
         1                = "1 child"
         2                = "2 children"
         3                = "3 3+ children"
         8                = "8 Not Ascertained"
    ;
 
    VALUE SA048X
         01               = "01 Through an employer, union, or professional organization"
         02               = "02 Purchased directly"
         03               = "03 Through Healthcare.gov or the Affordable Care Act, also known as Obamacare"
         04               = "04 Through a state or local government or community program"
         05               = "05 Other"
         06               = "06 Through school"
         07               = "07 Through parents"
         08               = "08 Through other relative"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA049X
         0-10.99          = "0.00 to 10.99"
         11.00            = "11.00+"
    ;
 
    VALUE SA050X
         1                = "1 Reassigned to private from public"
    ;
 
    VALUE SA051X
         1                = "1 Deductible is less than $1,400"
         2                = "2 Deductible is $1,400 or more"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA052X
         1                = "1 White only"
         2                = "2 Black/African American only"
         3                = "3 Asian only"
         4                = "4 AIAN only"
         5                = "5 AIAN and any other group"
         6                = "6 Other single and multiple races"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't know"
    ;
 
    VALUE SA053X
         01               = "01 0.00 - 0.49"
         02               = "02 0.50 - 0.74"
         03               = "03 0.75 - 0.99"
         04               = "04 1.00 - 1.24"
         05               = "05 1.25 - 1.49"
         06               = "06 1.50 - 1.74"
         07               = "07 1.75 - 1.99"
         08               = "08 2.00 - 2.49"
         09               = "09 2.50 - 2.99"
         10               = "10 3.00 - 3.49"
         11               = "11 3.50 - 3.99"
         12               = "12 4.00 - 4.49"
         13               = "13 4.50 - 4.99"
         14               = "14 5.00 or greater"
         98               = "98 Not Ascertained"
    ;
 
    VALUE SA054X
         10               = "10 Sample Adult"
         20               = "20 Sample Child"
         30               = "30 Sample Adult Income"
         40               = "40 Sample Child Income"
         50               = "50 Paradata"
    ;
 
    VALUE SA055X
         1                = "1 Northeast"
         2                = "2 Midwest"
         3                = "3 South"
         4                = "4 West"
    ;
 
    VALUE SA056X
         1                = "1 Sample adult is parent of sample child"
         2                = "2 Sample adult is not parent of  sample child"
         3                = "3 No sample child in sample adult's family"
         9                = "9 Unknown"
    ;
 
    VALUE SA057X
         00               = "00 None"
         1-39             = "1-39 days"
         40               = "40 40+ days"
         96               = "96 Did not go to school"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA058X
         2017-2021        = "2017-2021"
         9996             = "9996 Reported year before 2017"
         9997             = "9997 Refused"
         9998             = "9998 Not Ascertained"
         9999             = "9999 Don't Know"
    ;
 
    VALUE SA059X
         1                = "1 Current every day smoker"
         2                = "2 Current some day smoker"
         3                = "3 Former smoker"
         4                = "4 Never smoker"
         5                = "5 Smoker, current status unknown"
         9                = "9 Unknown if ever smoked"
    ;
 
    VALUE SA060X
         1                = "1 All of the time"
         2                = "2 Most of the time"
         3                = "3 Some of the time"
         4                = "4 None of the time"
         5                = "5 Only worked at main job when social distancing measures were in effect"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA061X
         1963-2021        = "Survey year"
    ;
 
    VALUE SA062X
         0                = "0 times"
         1                = "1 time"
         2                = "2 times"
         3                = "3 times"
         4                = "4 times"
         5                = "5 5+ times"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA063X
         1                = "1 Large central metro"
         2                = "2 Large fringe metro"
         3                = "3 Medium and small metro"
         4                = "4 Nonmetropolitan"
    ;
 
    VALUE SA064X
         1900-2030        = "Year"
         9997             = "9997 Refused"
         9998             = "9998 Not Ascertained"
         9999             = "9999 Don't Know"
    ;
 
    VALUE SA065X
         1                = "1 Yes"
         2                = "2 No"
         9                = "9 Don't Know"
    ;
 
    VALUE SA066X
         1                = "1 Yes"
         2                = "2 No"
         3                = "3 Unknown"
    ;
 
    VALUE SA067X
         1                = "1 Yes"
    ;
 
    VALUE SA068X
         1                = "1 Less than 1 year"
         2                = "2 1 to less than 5 years"
         3                = "3 5 to less than 10 years"
         4                = "4 10 to less than 15 years"
         5                = "5 15 years or more"
         9                = "9 Unknown"
    ;
 
    VALUE SA069X
         2006-2021        = "2006-2021"
         9996             = "9996 Reported year before 2006"
         9997             = "9997 Refused"
         9998             = "9998 Not Ascertained"
         9999             = "9999 Don't Know"
    ;
 
    VALUE SA070X
         1                = "1 Less than 65"
         2                = "2 65 or older"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA071X
         1                = "1 All of the time"
         2                = "2 Most of the time"
         3                = "3 Some of the time"
         4                = "4 A little of the time"
         5                = "5 None of the time"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA072X
         1                = "1 Very worried"
         2                = "2 Somewhat worried"
         3                = "3 Not at all worried"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA073X
         1                = "1 Better"
         2                = "2 Worse"
         3                = "3 No Change"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA074X
         1                = "1 More social and emotional support"
         2                = "2 Less social and emotional support"
         3                = "3 About the same"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA075X
         1                = "1 A few things"
         2                = "2 A lot of things"
         3                = "3 Almost everything"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA076X
         1                = "1 Sometimes"
         2                = "2 Often"
         3                = "3 All of the time"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA077X
         1                = "1 Difficulty remembering only"
         2                = "2 Difficulty concentrating only"
         3                = "3 Difficulty with both remembering and concentrating"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA078X
         1                = "1 Colonoscopy"
         2                = "2 Sigmoidoscopy"
         3                = "3 Both"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA079X
         1                = "1 Part of a routine exam"
         2                = "2 Because of a problem"
         3                = "3 Follow-up test of an earlier test or screening exam"
         4                = "4 Other reason"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA080X
         1                = "1 Yes"
         2                = "2 No"
         3                = "3 Did not receive results"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA081X
         1                = "1 No symptoms"
         2                = "2 Mild symptoms"
         3                = "3 Moderate symptoms"
         4                = "4 Severe symptoms"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA082X
         1                = "1 vaccination"
         2                = "2 vaccinations"
         3                = "3 More than 2 vaccinations"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA083X
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA084X
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA085X
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA086X
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA087X
         1                = "1 Less than 1 month"
         2                = "2 1 month to less than 6 months"
         3                = "3 6 months to less than 1 year"
         4                = "4 1 year or more"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA088X
         1                = "1 Type 1"
         2                = "2 Type 2"
         3                = "3 Other type of diabetes"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA089X
         1                = "1 No difficulty"
         2                = "2 Some difficulty"
         3                = "3 A lot of difficulty"
         4                = "4 Cannot do at all"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA090X
         1                = "1 No difficulty"
         2                = "2 A little difficulty"
         3                = "3 Moderate difficulty"
         4                = "4 A lot of difficulty"
         5                = "5 Cannot smell at all"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA091X
         1                = "1 No difficulty"
         2                = "2 A little difficulty"
         3                = "3 Moderate difficulty"
         4                = "4 A lot of difficulty"
         5                = "5 Cannot taste at all"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA092X
         00               = "00 Never attended/kindergarten only"
         01               = "01 Grade 1-11"
         02               = "02 12th grade, no diploma"
         03               = "03 GED or equivalent"
         04               = "04 High School Graduate"
         05               = "05 Some college, no degree"
         06               = "06 Associate degree: occupational, technical, or vocational program"
         07               = "07 Associate degree: academic program"
         08               = "08 Bachelor's degree (Example: BA, AB, BS, BBA)"
         09               = "09 Master's degree (Example: MA, MS, MEng, MEd, MBA)"
         10               = "10 Professional School or Doctoral degree (Example: MD, DDS, DVM, JD, PhD, EdD)"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA093X
         1                = "1 Employee of a PRIVATE company for wages"
         2                = "2 A FEDERAL government employee"
         3                = "3 A STATE government employee"
         4                = "4 A LOCAL government employee"
         5                = "5 Self-employed in OWN business, professional practice or farm"
         6                = "6 Working WITHOUT PAY in a family-owned business or farm"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA094X
         1                = "1 Within the past 12 months"
         2                = "2 1-5 years ago"
         3                = "3 Over 5 years ago"
         4                = "4 Never worked"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA095X
         01               = "01 Unemployed, laid off, looking for work"
         02               = "02 Seasonal/contract work"
         03               = "03 Retired"
         04               = "04 Unable to work for health reasons/disabled"
         05               = "05 Taking care of house or family"
         06               = "06 Going to school"
         07               = "07 Working at a family-owned job or business not for pay"
         08               = "08 Other"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA096X
         0                = "0"
         1                = "1"
         2                = "2 or 3"
         3                = "3 4 or more"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't know"
    ;
 
    VALUE SA097X
         1                = "1 Part of a routine exam"
         2                = "2 Because of a problem"
         3                = "3 Other reason"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA098X
         1                = "1 Every day"
         2                = "2 Some days"
         3                = "3 Not at all"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA099X
         1                = "1 Fully recovered"
         2                = "2 Partially recovered"
         3                = "3 Not recovered at all"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA100X
         1                = "1 All of the time"
         2                = "2 Some of the time"
         3                = "3 Rarely"
         4                = "4 Never"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA101X
         1                = "1 Owned or being bought"
         2                = "2 Rented"
         3                = "3 Other arrangement"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA102X
         1                = "1 Never"
         2                = "2 Some days"
         3                = "3 Most days"
         4                = "4 Every day"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA103X
         1                = "1 Daily"
         2                = "2 Weekly"
         3                = "3 Monthly"
         4                = "4 A few times a year"
         5                = "5 Never"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA104X
         1                = "1 day or less"
         2                = "2 to 3 days"
         3                = "3 4 to 6 days"
         4                = "4 1 to 2 weeks"
         5                = "5 2 to 4 weeks"
         6                = "6 More than 1 month"
         7                = "7 Refused"
         8                = "8 Not ascertained"
         9                = "9 Don't know"
    ;
 
    VALUE SA105X
         1                = "1 Not at all"
         2                = "2 A small amount"
         3                = "3 A moderate amount"
         4                = "4 A large amount"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA106X
         1                = "1 Very easy"
         2                = "2 Somewhat easy"
         3                = "3 Somewhat difficult"
         4                = "4 Very difficult"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA107X
         1                = "1 Very likely"
         2                = "2 Fairly likely"
         3                = "3 Somewhat likely"
         4                = "4 Not at all likely"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA108X
         1                = "1 Daytime shift"
         2                = "2 Evening shift"
         3                = "3 Night shift"
         4                = "4 Rotating shift"
         5                = "5 Some other shift"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA109X
         1                = "1 A little"
         2                = "2 A lot"
         3                = "3 Somewhere in between a little and a lot"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA110X
         1                = "1 LSATIS11_A asked first in SA"
         2                = "2 LSATIS4_A asked first in SA"
    ;
 
    VALUE SA111X
         01               = "01 No reason/never thought about it"
         02               = "02 Didn't need it/didn't know I needed this type of test"
         03               = "03 Doctor didn't order it/didn't say I needed it"
         04               = "04 Haven't had any problems"
         05               = "05 Put it off/didn't get around to it"
         06               = "06 Too expensive/no insurance/cost"
         07               = "07 Too painful, unpleasant, or embarrassing"
         08               = "08 Don't have a doctor"
         09               = "09 I am too old"
         10               = "10 I am too young"
         11               = "11 Other"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA112X
         1                = "1 Married"
         2                = "2 Living with a partner together as an unmarried couple"
         3                = "3 Neither"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA113X
         1                = "1 Part A- hospital only"
         2                = "2 Part B- medical only"
         3                = "3 Both Part A and Part B"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA114X
         1                = "1 Mentioned"
         2                = "2 Not mentioned"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA115X
         01               = "01 January"
         02               = "02 February"
         03               = "03 March"
         04               = "04 April"
         05               = "05 May"
         06               = "06 June"
         07               = "07 July"
         08               = "08 August"
         09               = "09 September"
         10               = "10 October"
         11               = "11 November"
         12               = "12 December"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA116X
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA117X
         1                = "1 Not at all"
         2                = "2 A little"
         3                = "3 A lot"
         4                = "4 Somewhere in between a little and a lot"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA118X
         0                = "0 No cancer"
         1-3              = "1-3 cancers"
         4                = "4 or more cancers"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA119X
         1                = "1 ^GayLesbian"
         2                = "2 Straight, that is, not ^gaylesbian"
         3                = "3 Bisexual"
         4                = "4 Something else"
         5                = "5 I don't know the answer"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA120X
         1                = "1 Less overwhelmed"
         2                = "2 More overwhelmed"
         3                = "3 About the same"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA121X
         01               = "01 No reason/never thought about it"
         02               = "02 Didn't need it/didn't know I needed this type of test"
         03               = "03 Doctor didn't order it/didn't say I needed it"
         04               = "04 Haven't had any problems"
         05               = "05 Put it off/didn't get around to it"
         06               = "06 Too expensive/no insurance/cost"
         07               = "07 Too painful, unpleasant, or embarrassing"
         08               = "08 Had hysterectomy"
         09               = "09 Don't have a doctor"
         10               = "10 Had HPV vaccine"
         11               = "11 I am too old"
         12               = "12 I am too young"
         13               = "13 Other"
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA122X
         1                = "1 Excellent"
         2                = "2 Very Good"
         3                = "3 Good"
         4                = "4 Fair"
         5                = "5 Poor"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA123X
         1                = "1 A doctor's office or health center"
         2                = "2 Urgent care center or clinic in a drug store or grocery store"
         3                = "3 Hospital emergency room"
         4                = "4 A VA Medical Center or VA outpatient clinic"
         5                = "5 Some other place"
         6                = "6 Does not go to one place most often"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA124X
         1                = "1 Less than ^HDHPAMT_A"
         2                = "2 ^HDHPAMT_A or more"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA125X
         1                = "1 Relative who lives in household"
         2                = "2 Relative who doesn't live in household"
         3                = "3 Nonrelative who lives in household"
         4                = "4 Nonrelative who does not live in household"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA126X
         1                = "1 Child"
         2                = "2 Spouse"
         3                = "3 Former spouse"
         4                = "4 Some other relationship"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA127X
         1                = "1 None of the cost"
         2                = "2 Part of the cost"
         3                = "3 All of the cost"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA128X
         1                = "1 Self"
         2                = "2 Doctor"
         3                = "3 Someone else"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA129X
         1                = "1 One pneumonia shot"
         2                = "2 Two pneumonia shots"
         3                = "3 More than two pneumonia shots"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA130X
         1                = "1 All of the time"
         2                = "2 Most of the time"
         3                = "3 Some of the time"
         4                = "4 None of the time"
         5                = "5 Only worked at main job while social distancing measures were in effect"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA131X
         1                = "1 Available"
         2                = "2 Not Available or not able to answer right now"
         3                = "3 Physical or mental condition prohibits responding"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
    ;
 
    VALUE SA132X
         1                = "1 Very satisfied"
         2                = "2 Satisfied"
         3                = "3 Dissatisfied"
         4                = "4 Very dissatisfied"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA133X
         97               = "97 Refused"
         98               = "98 Not Ascertained"
         99               = "99 Don't Know"
    ;
 
    VALUE SA134X
         1                = "1 All of the time"
         2                = "2 Most of the time"
         3                = "3 Some of the time"
         4                = "4 None of the time"
         5                = "5 Did not work at main job when social distancing measures were in effect"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA135X
         1                = "1 Male"
         2                = "2 Female"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA136X
         1                = "1 One Shingrix shot"
         2                = "2 Two Shingrix shots"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA137X
         1                = "1 All of the time"
         2                = "2 Most of the time"
         3                = "3 Some of the time"
         4                = "4 None of the time"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA138X
         1                = "1 SSI"
         2                = "2 SSDI"
         3                = "3 Both SSI and SSDI"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA139X
         0                = "0 Not applicable/None eligible"
         1                = "1 Completed"
         2                = "2 HH member selected"
         3                = "3 Reached Sample Adult"
         4                = "4 Started HIS section"
         5                = "5 Sufficient Partial"
         6                = "6 HH member selected and no longer eligible"
         7                = "7 Refused"
    ;
 
    VALUE SA140X
         1                = "1 Always"
         2                = "2 Usually"
         3                = "3 Sometimes"
         4                = "4 Rarely"
         5                = "5 Never"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA141X
         1                = "1 Within the past year (anytime less than 12 months ago)"
         2                = "2 Within the past 2 years (1 year but less than 2 years ago)"
         3                = "3 Within the past 3 years (2 years but less than 3 years ago)"
         4                = "4 Within the past 5 years (3 years but less than 5 years ago)"
         5                = "5 Within the past 10 years (5 years but less than 10 year ago)"
         6                = "6 10 years ago or more"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA142X
         0                = "0 Never"
         1                = "1 Within the past year (anytime less than 12 months ago)"
         2                = "2 Within the last 2 years (1 year but less than 2 years ago)"
         3                = "3 Within the last 3 years (2 years but less than 3 years ago)"
         4                = "4 Within the last 5 years (3 years but less than 5 years ago)"
         5                = "5 Within the last 10 years (5 years but less than 10 years ago)"
         6                = "6 10 years ago or more"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA143X
         1                = "1 Less than 1 year"
         2                = "2 1 to 3 years"
         3                = "3 4 to 10 years"
         4                = "4 11 to 20 years"
         5                = "5 More than 20 years"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA144X
         1                = "1 Often true"
         2                = "2 Sometimes true"
         3                = "3 Never true"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA145X
         1                = "1 Yes"
         2                = "2 There is NO place"
         3                = "3 There is MORE THAN ONE place"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA146X
         1                = "1 All of the time"
         2                = "2 Most of the time"
         3                = "3 Some of the time"
         4                = "4 None of the time"
         5                = "5 Only worked at current main job while social distancing measures were in effect"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA147X
         1                = "1 Yes"
         2                = "2 No"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA148X
         1                = "1 Before pregnancy"
         2                = "2 During pregnancy"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA149X
         1                = "1 Before pregnancy"
         2                = "2 During pregnancy"
         3                = "3 After pregnancy"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
 
    VALUE SA150X
         1                = "1 Under 30 years"
         2                = "2 30-39"
         3                = "3 40-49"
         4                = "4 50-59"
         5                = "5 60-74"
         6                = "6 75 years or older"
         7                = "7 Refused"
         8                = "8 Not Ascertained"
         9                = "9 Don't Know"
    ;
run;
 
/* data step to load ASCII file into a SAS dataset */
data NHIS.&adultds;
    infile ASCIIDAT pad;
 
    /* define variable lengths */
    length 
         /* IDN  LENGTHS */
         RECTYPE                  3    SRVY_YR                  3    HHX                 $    7  
         WTFA_A                   8  
 
         /* UCF  LENGTHS */
         URBRRL                   3    REGION                   3    PSTRAT                   3  
         PPSU                     3  
 
         /* FLG  LENGTHS */
         HHRESPSA_FLG             3  
 
         /* GEN  LENGTHS */
         INTV_QRT                 3    INTV_MON                 3    HHSTAT_A                 3  
         ASTATNEW                 3    AVAIL_A                  3    PROXY_A                  3  
         PROXYREL_A               3  
 
         /* HHC  LENGTHS */
         AGEP_A                   3    AGE65                    3    SEX_A                    3  
         EDUCP_A                  3    AFNOW                    3    HISP_A                   3  
         HISPALLP_A               3    HISDETP_A                3    RACEALLP_A               3  
         PCNT18UPTC               3    PCNTLT18TC               3  
 
         /* FAM  LENGTHS */
         PCNTADLT_A               3    PCNTKIDS_A               3    OVER65FLG_A              3  
         MLTFAMFLG_A              3    MAXEDUCP_A               3  
 
         /* HIS  LENGTHS */
         PHSTAT_A                 3  
 
         /* LS3  LENGTHS */
         LSATIS11R_A              3    LSATIS4R_A               3    LSROTATE_FLG             3  
 
 
         /* HYP  LENGTHS */
         HYPEV_A                  3    HYPDIF_A                 3    HYP12M_A                 3  
         HYPMED_A                 3  
 
         /* CHL  LENGTHS */
         CHLEV_A                  3    CHL12M_A                 3    CHLMED_A                 3  
 
 
         /* CVC  LENGTHS */
         CHDEV_A                  3    ANGEV_A                  3    MIEV_A                   3  
         STREV_A                  3  
 
         /* ASP  LENGTHS */
         ASPMEDEV_A               3    ASPMEDNOWN_A             3    ASPMEDSTP_A              3  
         ASPONOWN_A               3  
 
         /* AST  LENGTHS */
         ASEV_A                   3    ASTILL_A                 3    ASAT12M_A                3  
         ASER12M_A                3  
 
         /* CAN  LENGTHS */
         CANEV_A                  3    BLADDCAN_A               3    BLADDAGETC_A             3  
         BLOODCAN_A               3    BLOODAGETC_A             3    BONECAN_A                3  
         BONEAGETC_A              3    BRAINCAN_A               3    BRAINAGETC_A             3  
         BREASCAN_A               3    BREASAGETC_A             3    CERVICAN_A               3  
         CERVIAGETC_A             3    COLONCAN_A               3    COLONAGETC_A             3  
         ESOPHCAN_A               3    ESOPHAGETC_A             3    GALLBCAN_A               3  
         GALLBAGETC_A             3    LARYNCAN_A               3    LARYNAGETC_A             3  
         LEUKECAN_A               3    LEUKEAGETC_A             3    LIVERCAN_A               3  
         LIVERAGETC_A             3    LUNGCAN_A                3    LUNGAGETC_A              3  
         LYMPHCAN_A               3    LYMPHAGETC_A             3    MELANCAN_A               3  
         MELANAGETC_A             3    MOUTHCAN_A               3    MOUTHAGETC_A             3  
         OVARYCAN_A               3    OVARYAGETC_A             3    PANCRCAN_A               3  
         PANCRAGETC_A             3    PROSTCAN_A               3    PROSTAGETC_A             3  
         RECTUCAN_A               3    RECTUAGETC_A             3    SKNMCAN_A                3  
         SKNMAGETC_A              3    SKNNMCAN_A               3    SKNNMAGETC_A             3  
         SKNDKCAN_A               3    SKNDKAGETC_A             3    STOMACAN_A               3  
         STOMAAGETC_A             3    THROACAN_A               3    THROAAGETC_A             3  
         THYROCAN_A               3    THYROAGETC_A             3    UTERUCAN_A               3  
         UTERUAGETC_A             3    HDNCKCAN_A               3    HDNCKAGETC_A             3  
         COLRCCAN_A               3    COLRCAGETC_A             3    OTHERCANP_A              3  
         OTHERAGETC_A             3    NUMCAN_A                 3  
 
         /* DIB  LENGTHS */
         PREDIB_A                 3    GESDIB_A                 3    DIBEV_A                  3  
         DIBAGETC_A               3    DIFYRSTC1_A              3    DIBPILL_A                3  
         DIBINS_A                 3    DIBINSTIME_A             3    DIBINSSTOP_A             3  
         DIBINSSTYR_A             3    INSSKIP12M_A             3    INSLESS12M_A             3  
         INSDLY12M_A              3    DIBTYPE_A                3    DIBSTRESS_A              3  
         DIBCSTRESS_A             3  
 
         /* CON  LENGTHS */
         COPDEV_A                 3    ARTHEV_A                 3    DEMENEV_A                3  
         ANXEV_A                  3    DEPEV_A                  3  
 
         /* RCN  LENGTHS */
         KIDWEAKEV_A              3    HEPEV_A                  3    LIVEREV_A                3  
         CFSEV_A                  3    CFSNOW_A                 3    COLDFLU12M_A             3  
         DRYMTH12M_A              3  
 
         /* ISN  LENGTHS */
         MEDRXTRT_A               3    HLTHCOND_A               3  
 
         /* EPI  LENGTHS */
         EPIEV_A                  3    EPIMED_A                 3    EPINUMSEZP_A             3  
         EPIDR_A                  3  
 
         /* ALG  LENGTHS */
         CURRESP_A                3    DXRESP_A                 3    CURFOOD_A                3  
         DXFOOD_A                 3    CURSKIN_A                3    DXSKIN_A                 3  
 
 
         /* BMI  LENGTHS */
         PREGNOW_A                3    HEIGHTTC_A               3    WEIGHTLBTC_A             3  
         BMICAT_A                 3  
 
         /* VIS  LENGTHS */
         WEARGLSS_A               3    VISIONDF_A               3  
 
         /* HEA  LENGTHS */
         HEARAID_A                3    HEARAIDFR_A              3    HEARINGDF_A              3  
         HEARQTRM_A               3    HEARNYRM_A               3  
 
         /* MOB  LENGTHS */
         DIFF_A                   3    EQUIP_A                  3    WLK100_A                 3  
         WLK13M_A                 3    STEPS_A                  3    CANEWLKR_A               3  
         WCHAIR_A                 3    PERASST_A                3    NOEQWLK100_A             3  
         NOEQWLK13M_A             3    NOEQSTEPS_A              3    EQWLK100_A               3  
         EQWLK13M_A               3    EQSTEPS_A                3  
 
         /* COM  LENGTHS */
         COMDIFF_A                3    COMUSESL_A               3  
 
         /* COG  LENGTHS */
         COGMEMDFF_A              3    COGTYPEDFF_A             3    COGFRQDFF_A              3  
         COGAMTDFF_A              3  
 
         /* UPP  LENGTHS */
         UPPSLFCR_A               3    UPPRAISE_A               3    UPPOBJCT_A               3  
         DISAB3_A                 3  
 
         /* SOC  LENGTHS */
         SOCERRNDS_A              3    SOCSCLPAR_A              3    SOCWRKLIM_A              3  
 
 
         /* ADO  LENGTHS */
         DEVDONSET_A              3  
 
         /* INS  LENGTHS */
         NOTCOV_A                 3    COVER_A                  3    COVER65_A                3  
         SINCOVDE_A               3    SINCOVVS_A               3    SINCOVRX_A               3  
         MEDICARE_A               3    MCPART_A                 3    MCCHOICE_A               3  
         MCHMO_A                  3    MCADVR_A                 3    MCPARTD_A                3  
         MEDICAID_A               3    MAXCHNG_A                3    MAPREM_A                 3  
         MADEDUC_A                3    MAHDHP_A                 3    MAFLG_A                  3  
         PRIVATE_A                3    EXCHANGE_A               3    POLHLD1_A                3  
         PRPLCOV1_A               3    PRPOLH1_A                3    PRPLCOV1_C_A             3  
         PLNWRKR1_A               3    PLNEXCHG1_A              3    PLN1PAY1_A               3  
         PLN1PAY2_A               3    PLN1PAY3_A               3    PLN1PAY4_A               3  
         PLN1PAY5_A               3    PLN1PAY6_A               3    HICOSTR1_A               3  
         PRDEDUC1_A               3    PRHDHP1_A                3    HSAHRA1_A                3  
         PRRXCOV1_A               3    PRDNCOV1_A               3    PRVSCOV1_A               3  
         EXCHPR1_A                3    PRFLG_A                  3    PXCHNG1_A                3  
         PRPREM1_A                3    PLEXCHPR1_A              3    POLHLD2_A                3  
         PRPLCOV2_A               3    PRPOLH2_A                3    PRPLCOV2_C_A             3  
         PLNWRKR2_A               3    PLNEXCHG2_A              3    PLN2PAY1_A               3  
         PLN2PAY2_A               3    PLN2PAY3_A               3    PLN2PAY4_A               3  
         PLN2PAY5_A               3    PLN2PAY6_A               3    HICOSTR2_A               3  
         PRDEDUC2_A               3    PRHDHP2_A                3    HSAHRA2_A                3  
         PRRXCOV2_A               3    PRDNCOV2_A               3    PRVSCOV2_A               3  
         EXCHPR2_A                3    CHIP_A                   3    CHXCHNG_A                3  
         CHPREM_A                 3    CHDEDUC_A                3    CHHDHP_A                 3  
         CHFLG_A                  3    OTHPUB_A                 3    OPXCHNG_A                3  
         OPPREM_A                 3    OPDEDUC_A                3    OPHDHP_A                 3  
         PLEXCHOP_A               3    OPFLG_A                  3    OTHGOV_A                 3  
         OGXCHNG_A                3    OGPREM_A                 3    OGDEDUC_A                3  
         OGHDHP_A                 3    PLEXCHOG_A               3    OGFLG_A                  3  
         MILITARY_A               3    MILSPC1R_A               3    MILSPC2_A                3  
         MILSPC3_A                3    IHS_A                    3    HILAST_A                 3  
         HILASTMY_A               3    HISTOPJOB_A              3    HISTOPMISS_A             3  
         HISTOPAGE_A              3    HISTOPCOST_A             3    HISTOPELIG_A             3  
         RSNHICOST_A              3    RSNHIWANT_A              3    RSNHIELIG_A              3  
         RSNHICONF_A              3    RSNHIMEET_A              3    RSNHIWAIT_A              3  
         RSNHIOTH_A               3    RSNHIJOB_A               3    RSNHIMISS_A              3  
         HINOTYR_A                3    HINOTMYR_A               3    MILSPC1_A                3  
         HICOV_A                  3    HIKIND01_A               3    HIKIND02_A               3  
         HIKIND03_A               3    HIKIND04_A               3    HIKIND05_A               3  
         HIKIND06_A               3    HIKIND07_A               3    HIKIND08_A               3  
         HIKIND09_A               3    HIKIND10_A               3    MCAREPRB_A               3  
         MCAIDPRB_A               3  
 
         /* PAY  LENGTHS */
         PAYBLL12M_A              3    PAYNOBLLNW_A             3    PAYWORRY_A               3  
 
 
         /* CVD  LENGTHS */
         CVDDIAG_A                3    COVIDTEST_A              3    CVDRSLT_A                3  
         CVDSEV_A                 3  
 
         /* TSC  LENGTHS */
         CVDSYMSM_A               3    CVDSMREC_A               3    CVDSYMTST_A              3  
         CVDTSTREC_A              3  
 
         /* UTZ  LENGTHS */
         LASTDR_A                 3    WELLNESS_A               3    WELLVIS_A                3  
         USUALPL_A                3    USPLKIND_A               3    URGNT12MTC_A             3  
         EMERG12MTC_A             3    HOSPONGT_A               3    MEDDL12M_A               3  
         MEDNG12M_A               3  
 
         /* ACC  LENGTHS */
         DLYCARE_A                3    DNGCARE_A                3    VIRAPP12M_A              3  
         VIRAPPCVD_A              3  
 
         /* CNV  LENGTHS */
         CANCOVTREA_A             3    CANCOVCHG_A              3    CANCOVOTH_A              3  
         CANCOVCARE_A             3  
 
         /* PMD  LENGTHS */
         RX12M_A                  3    RXSK12M_A                3    RXLS12M_A                3  
         RXDL12M_A                3    RXDG12M_A                3  
 
         /* PRV  LENGTHS */
         BPLAST_A                 3    CHOLLAST_A               3    DIBLAST1_A               3  
         DIBA1CLAST_A             3    DIBA1CNMT_A              3    COLORECTEV_A             3  
         COLORECTYP_A             3    COLWHEN_A                3    COLREASON_A              3  
         COLPAY_A                 3    COLSIGWHEN_A             3    SIGWHEN_A                3  
         CTCOLEV1_A               3    CTCOLWHEN1_A             3    FITHEV1_A                3  
         FITHWHEN1_A              3    COLOGUARD1_A             3    FITCOLG1_A               3  
         CGUARDWHE1_A             3    COLPROB1_A               3    COLTEST1_A               3  
         COLTEST2_A               3    COLTEST3_A               3    COLTEST4_A               3  
         COLTEST5_A               3    COLTEST6_A               3    PSATEST_A                3  
         PSAWHEN_A                3    PSAREASON_A              3    PSASUGGEST_A             3  
         CERVICEV1_A              3    CERVICWHEN_A             3    CERREASON1_A             3  
         PAPTEST_A                3    HPVTEST_A                3    TELLCERVIC_A             3  
         CERVICRES_A              3    CERVICNOT1_A             3    HYSTEV1_A                3  
         MAMEV_A                  3    MAMWHEN_A                3    MAMPAY_A                 3  
         MAMREASON_A              3    MAMAGE1ST1_A             3    MAMNOT1_A                3  
 
 
         /* IMS  LENGTHS */
         PREGFLUYR_A              3    LIVEBIRTH_A              3    SHTFLU12M_A              3  
         SHTFLUM_A                3    SHTFLUY_A                3    FLUPREG_A                3  
         FLUPREG2_A               3    SHTCVD19_A               3    SHTCVD19NM_A             3  
         CVDVAC1MR_A              3    CVDVAC1YR_A              3    CVDVAC2MR_A              3  
         CVDVAC2YR_A              3    SHTCVD19AV_A             3    SHTPNUEV_A               3  
         SHTPNEUNB_A              3    SHTSHINGLE_A             3    ZOSTAVAX1_A              3  
         ZOSTAVXYRP_A             3    ZOSTAWHEN_A              3    SHINGRIX1_A              3  
         SHINGRIXNB_A             3    SHINGRXYRP_A             3    SHINGWHEN_A              3  
         TDAPPREG_A               3    SHTHEPB_A                3    SHTHEPA_A                3  
         LIVEHEP_A                3    WORKHEALTH_A             3    WRKHLTHFC_A              3  
         TRAVEL_A                 3  
 
         /* CGR  LENGTHS */
         HOMEHC12M_A              3    HOMECAREDG_A             3    FAMCARE12M_A             3  
         FAMCAREDNG_A             3    FAMCARECVD_A             3  
 
         /* ANX  LENGTHS */
         ANXFREQ_A                3    ANXMED_A                 3    ANXLEVEL_A               3  
 
 
         /* DEP  LENGTHS */
         DEPFREQ_A                3    DEPMED_A                 3    DEPLEVEL_A               3  
 
 
         /* MHC  LENGTHS */
         MHRX_A                   3    MHTHRPY_A                3    MHTPYNOW_A               3  
         MHTHDLY_A                3    MHTHND_A                 3  
 
         /* SPD  LENGTHS */
         SAD_A                    3    NERVOUS_A                3    RESTLESS_A               3  
         HOPELESS_A               3    EFFORT_A                 3    WORTHLESS_A              3  
         K6SPD_A                  3  
 
         /* PAI  LENGTHS */
         PAIFRQ3M_A               3    PAIAMNT_A                3    PAIWKLM3M_A              3  
         PAIAFFM3M_A              3    PAIBACK3M_A              3    PAIULMB3M_A              3  
         PAILLMB3M_A              3    PAIHDFC3M_A              3    PAIAPG3M_A               3  
         PAITOOTH3M_A             3  
 
         /* REP  LENGTHS */
         REPSTRAIN_A              3    REPLIMIT_A               3    REPSAWDOC_A              3  
         REPWRKDYTC_A             3    REPFUTWRK_A              3    REPSTOPCHG_A             3  
         REPREDUCE_A              3    REPWRKCAUS_A             3  
 
         /* INJ  LENGTHS */
         ANYINJURY_A              3    INJLIMIT_A               3    NUMINJTC_A               3  
         INJHOME_A                3    INJWORK_A                3    INJSPORTS_A              3  
         INJFALL_A                3    INJFALLHOM_A             3    INJFALLWRK_A             3  
         INJMOTOR_A               3    INJMVTYPE1_A             3    INJMVTYPE2_A             3  
         INJMVTYPE3_A             3    INJMVTYPE4_A             3    INJMVTYPE5_A             3  
         INJCHORES_A              3    INJSAWDOC_A              3    INJER_A                  3  
         INJHOSP_A                3    INJBONES_A               3    INJSTITCH_A              3  
         INJWRKDYTC_A             3    INJFUTWRK_A              3    INJSTOPCHG_A             3  
         INJREDUCE_A              3  
 
         /* TSM  LENGTHS */
         SMELLDF_A                3    SMELLCOMP_A              3    SMELLPHT_A               3  
         TASTEDF_A                3    TASTECOMP_A              3    TASTEFLAV_A              3  
         TASTEUNW_A               3    TSTSMHP_A                3    TSTSMLAST_A              3  
 
 
         /* CIG  LENGTHS */
         SMKEV_A                  3    SMKNOW_A                 3    SMKCIGST_A               3  
         CIGNOW_A                 3    SMK30D_A                 3    CIG30D_A                 3  
         ECIGEV_A                 3    ECIGNOW_A                3    SMKECIGST_A              3  
 
 
         /* OTB  LENGTHS */
         CIGAREV_A                3    CIGARCUR_A               3    CIGAR30D_A               3  
         PIPEEV_A                 3    PIPECUR_A                3    SMOKELSEV_A              3  
         SMOKELSCUR_A             3  
 
         /* SOS  LENGTHS */
         SUPPORT_A                3    CMPSUPPORT_A             3  
 
         /* ORN  LENGTHS */
         ORIENT_A                 3  
 
         /* MAR  LENGTHS */
         MARITAL_A                3    SPOUSLIV_A               3    SPOUSEP_A                3  
         EVRMARRIED_A             3    MARSTAT_A                3    LEGMSTAT_A               3  
         SPOUSESEX_A              3    SASPPRACE_A              3    SASPPHISP_A              3  
         SPOUSAGETC_A             3    SPOUSEDUCP_A             3    SPOUSWRK_A               3  
         SPOUSWKFT_A              3    PRTNRSEX_A               3    PRTNRAGETC_A             3  
         PRTNREDUCP_A             3    PRTNRWRK_A               3    PRTNRWKFT_A              3  
         SAPARENTSC_A             3    PARSTAT_A                3  
 
         /* VET  LENGTHS */
         AFVET_A                  3    AFVETTRN_A               3    COMBAT_A                 3  
         VADISB_A                 3    VAHOSP_A                 3    VACAREEV_A               3  
 
 
         /* NAT  LENGTHS */
         NATUSBORN_A              3    YRSINUS_A                3    CITZNSTP_A               3  
 
 
         /* SCH  LENGTHS */
         SCHCURENR_A              3    SCHDYMSSTC_A             3  
 
         /* EMP  LENGTHS */
         EMPWRKLSW1_A             3    EMPWHYNOT_A              3    EMPLSTWOR1_A             3  
         EMPWKHRS3_A              3    EMPWRKFT1_A              3    EMPSICKLV_A              3  
         EMPHEALINS_A             3    EMPDYSMSS3_A             3  
 
         /* EMD  LENGTHS */
         EMDINDSTN1_A             3    EMDINDSTN2_A             3    EMDOCCUPN1_A             3  
         EMDOCCUPN2_A             3    EMDSUPER_A               3    EMDWRKCAT1_A             3  
 
 
         /* JOB  LENGTHS */
         JOBTAX_A                 3    JOBCHGEARN_A             3    JOBSHIFT_A               3  
         JOBCHGSCH_A              3    JOBVARYSCH_A             3    JOBADVSCH_A              3  
         JOBLKYLOSS_A             3    JOBWRKSICK_A             3    JOBMISS_A                3  
 
 
         /* SDW  LENGTHS */
         CURJOBSD1_A              3    WRKCLSSD1_A              3    WRKCLSNSD1_A             3  
         WRKCLSOFT1_A             3    SDMSRS1_A                3    SDMSRSOFT1_A             3  
         RECJOBSD1_A              3    JOBANYSD1_A              3    RJCLSSD1_A               3  
         CLSWRKSD1_A              3    RJCLSNOSD1_A             3    RJCLSOFT1_A              3  
         CLSWRKNOS1_A             3  
 
         /* FEM  LENGTHS */
         PCNTADTWKP_A             3    PCNTADTWFP_A             3  
 
         /* INC  LENGTHS */
         INCWRKO_A                3    INCINTER_A               3    INCSSRR_A                3  
         INCSSISSDI_A             3    SSISSDIBTH_A             3    SSISSDIDSB_A             3  
         INCWELF_A                3    INCRETIRE_A              3    INCOTHR_A                3  
         IMPNUM_A                 3    POVRATTC_A               8    RATCAT_A                 3  
         IMPINCFLG_A         $    5  
 
         /* FOO  LENGTHS */
         FSNAP12M_A               3    FSNAP30D_A               3    FWIC12M_A                3  
         FLUNCH12M_A              3  
 
         /* FDS  LENGTHS */
         FDSRUNOUT_A              3    FDSLAST_A                3    FDSBALANCE_A             3  
         FDSSKIP_A                3    FDSSKIPDYS_A             3    FDSLESS_A                3  
         FDSHUNGRY_A              3    FDSWEIGHT_A              3    FDSNOTEAT_A              3  
         FDSNEDAYS_A              3    FDSCAT3_A                3    FDSCAT4_A                3  
 
 
         /* HOU  LENGTHS */
         HOUYRSLIV_A              3    HOUTENURE_A              3    HOUGVASST_A              3  
 
    ;
 
/* input the data from the ASCII file */
    input 
         /* IDN  LOCATIONS */
         RECTYPE               1  - 2          SRVY_YR               3  - 6  
         HHX                 $ 7  -   13       WTFA_A                14  - 23  
 
         /* UCF  LOCATIONS */
         URBRRL                24  - 24        REGION                25  - 25  
         PSTRAT                26  - 28        PPSU                  29  - 31  
 
         /* FLG  LOCATIONS */
         HHRESPSA_FLG          32  - 32  
 
         /* GEN  LOCATIONS */
         INTV_QRT              33  - 33        INTV_MON              34  - 35  
         HHSTAT_A              36  - 36        ASTATNEW              37  - 37  
         AVAIL_A               38  - 38        PROXY_A               39  - 39  
         PROXYREL_A            40  - 40  
 
         /* HHC  LOCATIONS */
         AGEP_A                41  - 42        AGE65                 43  - 43  
         SEX_A                 44  - 44        EDUCP_A               45  - 46  
         AFNOW                 47  - 47        HISP_A                48  - 48  
         HISPALLP_A            49  - 50        HISDETP_A             51  - 51  
         RACEALLP_A            52  - 52        PCNT18UPTC            53  - 53  
         PCNTLT18TC            54  - 54  
 
         /* FAM  LOCATIONS */
         PCNTADLT_A            55  - 55        PCNTKIDS_A            56  - 56  
         OVER65FLG_A           57  - 57        MLTFAMFLG_A           58  - 58  
         MAXEDUCP_A            59  - 60  
 
         /* HIS  LOCATIONS */
         PHSTAT_A              61  - 61  
 
         /* LS3  LOCATIONS */
         LSATIS11R_A           62  - 63        LSATIS4R_A            64  - 64  
         LSROTATE_FLG          65  - 65  
 
         /* HYP  LOCATIONS */
         HYPEV_A               66  - 66        HYPDIF_A              67  - 67  
         HYP12M_A              68  - 68        HYPMED_A              69  - 69  
 
 
         /* CHL  LOCATIONS */
         CHLEV_A               70  - 70        CHL12M_A              71  - 71  
         CHLMED_A              72  - 72  
 
         /* CVC  LOCATIONS */
         CHDEV_A               73  - 73        ANGEV_A               74  - 74  
         MIEV_A                75  - 75        STREV_A               76  - 76  
 
 
         /* ASP  LOCATIONS */
         ASPMEDEV_A            77  - 77        ASPMEDNOWN_A          78  - 78  
         ASPMEDSTP_A           79  - 79        ASPONOWN_A            80  - 80  
 
 
         /* AST  LOCATIONS */
         ASEV_A                81  - 81        ASTILL_A              82  - 82  
         ASAT12M_A             83  - 83        ASER12M_A             84  - 84  
 
 
         /* CAN  LOCATIONS */
         CANEV_A               85  - 85        BLADDCAN_A            86  - 86  
         BLADDAGETC_A          87  - 88        BLOODCAN_A            89  - 89  
         BLOODAGETC_A          90  - 91        BONECAN_A             92  - 92  
         BONEAGETC_A           93  - 94        BRAINCAN_A            95  - 95  
         BRAINAGETC_A          96  - 97        BREASCAN_A            98  - 98  
         BREASAGETC_A          99  - 100       CERVICAN_A            101  - 101  
         CERVIAGETC_A          102  - 103      COLONCAN_A            104  - 104  
         COLONAGETC_A          105  - 106      ESOPHCAN_A            107  - 107  
         ESOPHAGETC_A          108  - 109      GALLBCAN_A            110  - 110  
         GALLBAGETC_A          111  - 112      LARYNCAN_A            113  - 113  
         LARYNAGETC_A          114  - 115      LEUKECAN_A            116  - 116  
         LEUKEAGETC_A          117  - 118      LIVERCAN_A            119  - 119  
         LIVERAGETC_A          120  - 121      LUNGCAN_A             122  - 122  
         LUNGAGETC_A           123  - 124      LYMPHCAN_A            125  - 125  
         LYMPHAGETC_A          126  - 127      MELANCAN_A            128  - 128  
         MELANAGETC_A          129  - 130      MOUTHCAN_A            131  - 131  
         MOUTHAGETC_A          132  - 133      OVARYCAN_A            134  - 134  
         OVARYAGETC_A          135  - 136      PANCRCAN_A            137  - 137  
         PANCRAGETC_A          138  - 139      PROSTCAN_A            140  - 140  
         PROSTAGETC_A          141  - 142      RECTUCAN_A            143  - 143  
         RECTUAGETC_A          144  - 145      SKNMCAN_A             146  - 146  
         SKNMAGETC_A           147  - 148      SKNNMCAN_A            149  - 149  
         SKNNMAGETC_A          150  - 151      SKNDKCAN_A            152  - 152  
         SKNDKAGETC_A          153  - 154      STOMACAN_A            155  - 155  
         STOMAAGETC_A          156  - 157      THROACAN_A            158  - 158  
         THROAAGETC_A          159  - 160      THYROCAN_A            161  - 161  
         THYROAGETC_A          162  - 163      UTERUCAN_A            164  - 164  
         UTERUAGETC_A          165  - 166      HDNCKCAN_A            167  - 167  
         HDNCKAGETC_A          168  - 169      COLRCCAN_A            170  - 170  
         COLRCAGETC_A          171  - 172      OTHERCANP_A           173  - 173  
         OTHERAGETC_A          174  - 175      NUMCAN_A              176  - 176  
 
 
         /* DIB  LOCATIONS */
         PREDIB_A              177  - 177      GESDIB_A              178  - 178  
         DIBEV_A               179  - 179      DIBAGETC_A            180  - 181  
         DIFYRSTC1_A           182  - 183      DIBPILL_A             184  - 184  
         DIBINS_A              185  - 185      DIBINSTIME_A          186  - 186  
         DIBINSSTOP_A          187  - 187      DIBINSSTYR_A          188  - 188  
         INSSKIP12M_A          189  - 189      INSLESS12M_A          190  - 190  
         INSDLY12M_A           191  - 191      DIBTYPE_A             192  - 192  
         DIBSTRESS_A           193  - 193      DIBCSTRESS_A          194  - 194  
 
 
         /* CON  LOCATIONS */
         COPDEV_A              195  - 195      ARTHEV_A              196  - 196  
         DEMENEV_A             197  - 197      ANXEV_A               198  - 198  
         DEPEV_A               199  - 199  
 
         /* RCN  LOCATIONS */
         KIDWEAKEV_A           200  - 200      HEPEV_A               201  - 201  
         LIVEREV_A             202  - 202      CFSEV_A               203  - 203  
         CFSNOW_A              204  - 204      COLDFLU12M_A          205  - 205  
         DRYMTH12M_A           206  - 206  
 
         /* ISN  LOCATIONS */
         MEDRXTRT_A            207  - 207      HLTHCOND_A            208  - 208  
 
 
         /* EPI  LOCATIONS */
         EPIEV_A               209  - 209      EPIMED_A              210  - 210  
         EPINUMSEZP_A          211  - 211      EPIDR_A               212  - 212  
 
 
         /* ALG  LOCATIONS */
         CURRESP_A             213  - 213      DXRESP_A              214  - 214  
         CURFOOD_A             215  - 215      DXFOOD_A              216  - 216  
         CURSKIN_A             217  - 217      DXSKIN_A              218  - 218  
 
 
         /* BMI  LOCATIONS */
         PREGNOW_A             219  - 219      HEIGHTTC_A            220  - 221  
         WEIGHTLBTC_A          222  - 224      BMICAT_A              225  - 225  
 
 
         /* VIS  LOCATIONS */
         WEARGLSS_A            226  - 226      VISIONDF_A            227  - 227  
 
 
         /* HEA  LOCATIONS */
         HEARAID_A             228  - 228      HEARAIDFR_A           229  - 229  
         HEARINGDF_A           230  - 230      HEARQTRM_A            231  - 231  
         HEARNYRM_A            232  - 232  
 
         /* MOB  LOCATIONS */
         DIFF_A                233  - 233      EQUIP_A               234  - 234  
         WLK100_A              235  - 235      WLK13M_A              236  - 236  
         STEPS_A               237  - 237      CANEWLKR_A            238  - 238  
         WCHAIR_A              239  - 239      PERASST_A             240  - 240  
         NOEQWLK100_A          241  - 241      NOEQWLK13M_A          242  - 242  
         NOEQSTEPS_A           243  - 243      EQWLK100_A            244  - 244  
         EQWLK13M_A            245  - 245      EQSTEPS_A             246  - 246  
 
 
         /* COM  LOCATIONS */
         COMDIFF_A             247  - 247      COMUSESL_A            248  - 248  
 
 
         /* COG  LOCATIONS */
         COGMEMDFF_A           249  - 249      COGTYPEDFF_A          250  - 250  
         COGFRQDFF_A           251  - 251      COGAMTDFF_A           252  - 252  
 
 
         /* UPP  LOCATIONS */
         UPPSLFCR_A            253  - 253      UPPRAISE_A            254  - 254  
         UPPOBJCT_A            255  - 255      DISAB3_A              256  - 256  
 
 
         /* SOC  LOCATIONS */
         SOCERRNDS_A           257  - 257      SOCSCLPAR_A           258  - 258  
         SOCWRKLIM_A           259  - 259  
 
         /* ADO  LOCATIONS */
         DEVDONSET_A           260  - 260  
 
         /* INS  LOCATIONS */
         NOTCOV_A              261  - 261      COVER_A               262  - 262  
         COVER65_A             263  - 263      SINCOVDE_A            264  - 264  
         SINCOVVS_A            265  - 265      SINCOVRX_A            266  - 266  
         MEDICARE_A            267  - 267      MCPART_A              268  - 268  
         MCCHOICE_A            269  - 269      MCHMO_A               270  - 270  
         MCADVR_A              271  - 271      MCPARTD_A             272  - 272  
         MEDICAID_A            273  - 273      MAXCHNG_A             274  - 274  
         MAPREM_A              275  - 275      MADEDUC_A             276  - 276  
         MAHDHP_A              277  - 277      MAFLG_A               278  - 278  
         PRIVATE_A             279  - 279      EXCHANGE_A            280  - 280  
         POLHLD1_A             281  - 281      PRPLCOV1_A            282  - 282  
         PRPOLH1_A             283  - 283      PRPLCOV1_C_A          284  - 284  
         PLNWRKR1_A            285  - 286      PLNEXCHG1_A           287  - 287  
         PLN1PAY1_A            288  - 288      PLN1PAY2_A            289  - 289  
         PLN1PAY3_A            290  - 290      PLN1PAY4_A            291  - 291  
         PLN1PAY5_A            292  - 292      PLN1PAY6_A            293  - 293  
         HICOSTR1_A            294  - 298      PRDEDUC1_A            299  - 299  
         PRHDHP1_A             300  - 300      HSAHRA1_A             301  - 301  
         PRRXCOV1_A            302  - 302      PRDNCOV1_A            303  - 303  
         PRVSCOV1_A            304  - 304      EXCHPR1_A             305  - 305  
         PRFLG_A               306  - 306      PXCHNG1_A             307  - 307  
         PRPREM1_A             308  - 308      PLEXCHPR1_A           309  - 309  
         POLHLD2_A             310  - 310      PRPLCOV2_A            311  - 311  
         PRPOLH2_A             312  - 312      PRPLCOV2_C_A          313  - 313  
         PLNWRKR2_A            314  - 315      PLNEXCHG2_A           316  - 316  
         PLN2PAY1_A            317  - 317      PLN2PAY2_A            318  - 318  
         PLN2PAY3_A            319  - 319      PLN2PAY4_A            320  - 320  
         PLN2PAY5_A            321  - 321      PLN2PAY6_A            322  - 322  
         HICOSTR2_A            323  - 327      PRDEDUC2_A            328  - 328  
         PRHDHP2_A             329  - 329      HSAHRA2_A             330  - 330  
         PRRXCOV2_A            331  - 331      PRDNCOV2_A            332  - 332  
         PRVSCOV2_A            333  - 333      EXCHPR2_A             334  - 334  
         CHIP_A                335  - 335      CHXCHNG_A             336  - 336  
         CHPREM_A              337  - 337      CHDEDUC_A             338  - 338  
         CHHDHP_A              339  - 339      CHFLG_A               340  - 340  
         OTHPUB_A              341  - 341      OPXCHNG_A             342  - 342  
         OPPREM_A              343  - 343      OPDEDUC_A             344  - 344  
         OPHDHP_A              345  - 345      PLEXCHOP_A            346  - 346  
         OPFLG_A               347  - 347      OTHGOV_A              348  - 348  
         OGXCHNG_A             349  - 349      OGPREM_A              350  - 350  
         OGDEDUC_A             351  - 351      OGHDHP_A              352  - 352  
         PLEXCHOG_A            353  - 353      OGFLG_A               354  - 354  
         MILITARY_A            355  - 355      MILSPC1R_A            356  - 356  
         MILSPC2_A             357  - 357      MILSPC3_A             358  - 358  
         IHS_A                 359  - 359      HILAST_A              360  - 360  
         HILASTMY_A            361  - 362      HISTOPJOB_A           363  - 363  
         HISTOPMISS_A          364  - 364      HISTOPAGE_A           365  - 365  
         HISTOPCOST_A          366  - 366      HISTOPELIG_A          367  - 367  
         RSNHICOST_A           368  - 368      RSNHIWANT_A           369  - 369  
         RSNHIELIG_A           370  - 370      RSNHICONF_A           371  - 371  
         RSNHIMEET_A           372  - 372      RSNHIWAIT_A           373  - 373  
         RSNHIOTH_A            374  - 374      RSNHIJOB_A            375  - 375  
         RSNHIMISS_A           376  - 376      HINOTYR_A             377  - 377  
         HINOTMYR_A            378  - 379      MILSPC1_A             380  - 380  
         HICOV_A               381  - 381      HIKIND01_A            382  - 382  
         HIKIND02_A            383  - 383      HIKIND03_A            384  - 384  
         HIKIND04_A            385  - 385      HIKIND05_A            386  - 386  
         HIKIND06_A            387  - 387      HIKIND07_A            388  - 388  
         HIKIND08_A            389  - 389      HIKIND09_A            390  - 390  
         HIKIND10_A            391  - 391      MCAREPRB_A            392  - 392  
         MCAIDPRB_A            393  - 393  
 
         /* PAY  LOCATIONS */
         PAYBLL12M_A           394  - 394      PAYNOBLLNW_A          395  - 395  
         PAYWORRY_A            396  - 396  
 
         /* CVD  LOCATIONS */
         CVDDIAG_A             397  - 397      COVIDTEST_A           398  - 398  
         CVDRSLT_A             399  - 399      CVDSEV_A              400  - 400  
 
 
         /* TSC  LOCATIONS */
         CVDSYMSM_A            401  - 401      CVDSMREC_A            402  - 402  
         CVDSYMTST_A           403  - 403      CVDTSTREC_A           404  - 404  
 
 
         /* UTZ  LOCATIONS */
         LASTDR_A              405  - 405      WELLNESS_A            406  - 406  
         WELLVIS_A             407  - 407      USUALPL_A             408  - 408  
         USPLKIND_A            409  - 409      URGNT12MTC_A          410  - 410  
         EMERG12MTC_A          411  - 411      HOSPONGT_A            412  - 412  
         MEDDL12M_A            413  - 413      MEDNG12M_A            414  - 414  
 
 
         /* ACC  LOCATIONS */
         DLYCARE_A             415  - 415      DNGCARE_A             416  - 416  
         VIRAPP12M_A           417  - 417      VIRAPPCVD_A           418  - 418  
 
 
         /* CNV  LOCATIONS */
         CANCOVTREA_A          419  - 419      CANCOVCHG_A           420  - 420  
         CANCOVOTH_A           421  - 421      CANCOVCARE_A          422  - 422  
 
 
         /* PMD  LOCATIONS */
         RX12M_A               423  - 423      RXSK12M_A             424  - 424  
         RXLS12M_A             425  - 425      RXDL12M_A             426  - 426  
         RXDG12M_A             427  - 427  
 
         /* PRV  LOCATIONS */
         BPLAST_A              428  - 428      CHOLLAST_A            429  - 429  
         DIBLAST1_A            430  - 430      DIBA1CLAST_A          431  - 431  
         DIBA1CNMT_A           432  - 432      COLORECTEV_A          433  - 433  
         COLORECTYP_A          434  - 434      COLWHEN_A             435  - 435  
         COLREASON_A           436  - 436      COLPAY_A              437  - 437  
         COLSIGWHEN_A          438  - 438      SIGWHEN_A             439  - 439  
         CTCOLEV1_A            440  - 440      CTCOLWHEN1_A          441  - 441  
         FITHEV1_A             442  - 442      FITHWHEN1_A           443  - 443  
         COLOGUARD1_A          444  - 444      FITCOLG1_A            445  - 445  
         CGUARDWHE1_A          446  - 446      COLPROB1_A            447  - 447  
         COLTEST1_A            448  - 448      COLTEST2_A            449  - 449  
         COLTEST3_A            450  - 450      COLTEST4_A            451  - 451  
         COLTEST5_A            452  - 452      COLTEST6_A            453  - 453  
         PSATEST_A             454  - 454      PSAWHEN_A             455  - 455  
         PSAREASON_A           456  - 456      PSASUGGEST_A          457  - 457  
         CERVICEV1_A           458  - 458      CERVICWHEN_A          459  - 459  
         CERREASON1_A          460  - 460      PAPTEST_A             461  - 461  
         HPVTEST_A             462  - 462      TELLCERVIC_A          463  - 463  
         CERVICRES_A           464  - 464      CERVICNOT1_A          465  - 466  
         HYSTEV1_A             467  - 467      MAMEV_A               468  - 468  
         MAMWHEN_A             469  - 469      MAMPAY_A              470  - 470  
         MAMREASON_A           471  - 471      MAMAGE1ST1_A          472  - 472  
         MAMNOT1_A             473  - 474  
 
         /* IMS  LOCATIONS */
         PREGFLUYR_A           475  - 475      LIVEBIRTH_A           476  - 476  
         SHTFLU12M_A           477  - 477      SHTFLUM_A             478  - 479  
         SHTFLUY_A             480  - 483      FLUPREG_A             484  - 484  
         FLUPREG2_A            485  - 485      SHTCVD19_A            486  - 486  
         SHTCVD19NM_A          487  - 487      CVDVAC1MR_A           488  - 489  
         CVDVAC1YR_A           490  - 493      CVDVAC2MR_A           494  - 495  
         CVDVAC2YR_A           496  - 499      SHTCVD19AV_A          500  - 500  
         SHTPNUEV_A            501  - 501      SHTPNEUNB_A           502  - 502  
         SHTSHINGLE_A          503  - 503      ZOSTAVAX1_A           504  - 504  
         ZOSTAVXYRP_A          505  - 508      ZOSTAWHEN_A           509  - 509  
         SHINGRIX1_A           510  - 510      SHINGRIXNB_A          511  - 511  
         SHINGRXYRP_A          512  - 515      SHINGWHEN_A           516  - 516  
         TDAPPREG_A            517  - 517      SHTHEPB_A             518  - 518  
         SHTHEPA_A             519  - 519      LIVEHEP_A             520  - 520  
         WORKHEALTH_A          521  - 521      WRKHLTHFC_A           522  - 522  
         TRAVEL_A              523  - 523  
 
         /* CGR  LOCATIONS */
         HOMEHC12M_A           524  - 524      HOMECAREDG_A          525  - 525  
         FAMCARE12M_A          526  - 526      FAMCAREDNG_A          527  - 527  
         FAMCARECVD_A          528  - 528  
 
         /* ANX  LOCATIONS */
         ANXFREQ_A             529  - 529      ANXMED_A              530  - 530  
         ANXLEVEL_A            531  - 531  
 
         /* DEP  LOCATIONS */
         DEPFREQ_A             532  - 532      DEPMED_A              533  - 533  
         DEPLEVEL_A            534  - 534  
 
         /* MHC  LOCATIONS */
         MHRX_A                535  - 535      MHTHRPY_A             536  - 536  
         MHTPYNOW_A            537  - 537      MHTHDLY_A             538  - 538  
         MHTHND_A              539  - 539  
 
         /* SPD  LOCATIONS */
         SAD_A                 540  - 540      NERVOUS_A             541  - 541  
         RESTLESS_A            542  - 542      HOPELESS_A            543  - 543  
         EFFORT_A              544  - 544      WORTHLESS_A           545  - 545  
         K6SPD_A               546  - 546  
 
         /* PAI  LOCATIONS */
         PAIFRQ3M_A            547  - 547      PAIAMNT_A             548  - 548  
         PAIWKLM3M_A           549  - 549      PAIAFFM3M_A           550  - 550  
         PAIBACK3M_A           551  - 551      PAIULMB3M_A           552  - 552  
         PAILLMB3M_A           553  - 553      PAIHDFC3M_A           554  - 554  
         PAIAPG3M_A            555  - 555      PAITOOTH3M_A          556  - 556  
 
 
         /* REP  LOCATIONS */
         REPSTRAIN_A           557  - 557      REPLIMIT_A            558  - 558  
         REPSAWDOC_A           559  - 559      REPWRKDYTC_A          560  - 561  
         REPFUTWRK_A           562  - 562      REPSTOPCHG_A          563  - 563  
         REPREDUCE_A           564  - 564      REPWRKCAUS_A          565  - 565  
 
 
         /* INJ  LOCATIONS */
         ANYINJURY_A           566  - 566      INJLIMIT_A            567  - 567  
         NUMINJTC_A            568  - 569      INJHOME_A             570  - 570  
         INJWORK_A             571  - 571      INJSPORTS_A           572  - 572  
         INJFALL_A             573  - 573      INJFALLHOM_A          574  - 574  
         INJFALLWRK_A          575  - 575      INJMOTOR_A            576  - 576  
         INJMVTYPE1_A          577  - 577      INJMVTYPE2_A          578  - 578  
         INJMVTYPE3_A          579  - 579      INJMVTYPE4_A          580  - 580  
         INJMVTYPE5_A          581  - 581      INJCHORES_A           582  - 582  
         INJSAWDOC_A           583  - 583      INJER_A               584  - 584  
         INJHOSP_A             585  - 585      INJBONES_A            586  - 586  
         INJSTITCH_A           587  - 587      INJWRKDYTC_A          588  - 589  
         INJFUTWRK_A           590  - 590      INJSTOPCHG_A          591  - 591  
         INJREDUCE_A           592  - 592  
 
         /* TSM  LOCATIONS */
         SMELLDF_A             593  - 593      SMELLCOMP_A           594  - 594  
         SMELLPHT_A            595  - 595      TASTEDF_A             596  - 596  
         TASTECOMP_A           597  - 597      TASTEFLAV_A           598  - 598  
         TASTEUNW_A            599  - 599      TSTSMHP_A             600  - 600  
         TSTSMLAST_A           601  - 601  
 
         /* CIG  LOCATIONS */
         SMKEV_A               602  - 602      SMKNOW_A              603  - 603  
         SMKCIGST_A            604  - 604      CIGNOW_A              605  - 606  
         SMK30D_A              607  - 608      CIG30D_A              609  - 610  
         ECIGEV_A              611  - 611      ECIGNOW_A             612  - 612  
         SMKECIGST_A           613  - 613  
 
         /* OTB  LOCATIONS */
         CIGAREV_A             614  - 614      CIGARCUR_A            615  - 615  
         CIGAR30D_A            616  - 617      PIPEEV_A              618  - 618  
         PIPECUR_A             619  - 619      SMOKELSEV_A           620  - 620  
         SMOKELSCUR_A          621  - 621  
 
         /* SOS  LOCATIONS */
         SUPPORT_A             622  - 622      CMPSUPPORT_A          623  - 623  
 
 
         /* ORN  LOCATIONS */
         ORIENT_A              624  - 624  
 
         /* MAR  LOCATIONS */
         MARITAL_A             625  - 625      SPOUSLIV_A            626  - 626  
         SPOUSEP_A             627  - 627      EVRMARRIED_A          628  - 628  
         MARSTAT_A             629  - 629      LEGMSTAT_A            630  - 630  
         SPOUSESEX_A           631  - 631      SASPPRACE_A           632  - 632  
         SASPPHISP_A           633  - 633      SPOUSAGETC_A          634  - 635  
         SPOUSEDUCP_A          636  - 637      SPOUSWRK_A            638  - 638  
         SPOUSWKFT_A           639  - 639      PRTNRSEX_A            640  - 640  
         PRTNRAGETC_A          641  - 642      PRTNREDUCP_A          643  - 644  
         PRTNRWRK_A            645  - 645      PRTNRWKFT_A           646  - 646  
         SAPARENTSC_A          647  - 647      PARSTAT_A             648  - 648  
 
 
         /* VET  LOCATIONS */
         AFVET_A               649  - 649      AFVETTRN_A            650  - 650  
         COMBAT_A              651  - 651      VADISB_A              652  - 652  
         VAHOSP_A              653  - 653      VACAREEV_A            654  - 654  
 
 
         /* NAT  LOCATIONS */
         NATUSBORN_A           655  - 655      YRSINUS_A             656  - 656  
         CITZNSTP_A            657  - 657  
 
         /* SCH  LOCATIONS */
         SCHCURENR_A           658  - 658      SCHDYMSSTC_A          659  - 660  
 
 
         /* EMP  LOCATIONS */
         EMPWRKLSW1_A          661  - 661      EMPWHYNOT_A           662  - 663  
         EMPLSTWOR1_A          664  - 664      EMPWKHRS3_A           665  - 666  
         EMPWRKFT1_A           667  - 667      EMPSICKLV_A           668  - 668  
         EMPHEALINS_A          669  - 669      EMPDYSMSS3_A          670  - 672  
 
 
         /* EMD  LOCATIONS */
         EMDINDSTN1_A          673  - 674      EMDINDSTN2_A          675  - 676  
         EMDOCCUPN1_A          677  - 678      EMDOCCUPN2_A          679  - 680  
         EMDSUPER_A            681  - 681      EMDWRKCAT1_A          682  - 682  
 
 
         /* JOB  LOCATIONS */
         JOBTAX_A              683  - 683      JOBCHGEARN_A          684  - 684  
         JOBSHIFT_A            685  - 685      JOBCHGSCH_A           686  - 686  
         JOBVARYSCH_A          687  - 687      JOBADVSCH_A           688  - 688  
         JOBLKYLOSS_A          689  - 689      JOBWRKSICK_A          690  - 691  
         JOBMISS_A             692  - 693  
 
         /* SDW  LOCATIONS */
         CURJOBSD1_A           694  - 694      WRKCLSSD1_A           695  - 695  
         WRKCLSNSD1_A          696  - 696      WRKCLSOFT1_A          697  - 697  
         SDMSRS1_A             698  - 698      SDMSRSOFT1_A          699  - 699  
         RECJOBSD1_A           700  - 700      JOBANYSD1_A           701  - 701  
         RJCLSSD1_A            702  - 702      CLSWRKSD1_A           703  - 703  
         RJCLSNOSD1_A          704  - 704      RJCLSOFT1_A           705  - 705  
         CLSWRKNOS1_A          706  - 706  
 
         /* FEM  LOCATIONS */
         PCNTADTWKP_A          707  - 707      PCNTADTWFP_A          708  - 708  
 
 
         /* INC  LOCATIONS */
         INCWRKO_A             709  - 709      INCINTER_A            710  - 710  
         INCSSRR_A             711  - 711      INCSSISSDI_A          712  - 712  
         SSISSDIBTH_A          713  - 713      SSISSDIDSB_A          714  - 714  
         INCWELF_A             715  - 715      INCRETIRE_A           716  - 716  
         INCOTHR_A             717  - 717      IMPNUM_A              718  - 719  
         POVRATTC_A            720  - 724      RATCAT_A              725  - 726  
         IMPINCFLG_A         $ 727  -  727 
 
         /* FOO  LOCATIONS */
         FSNAP12M_A            728  - 728      FSNAP30D_A            729  - 729  
         FWIC12M_A             730  - 730      FLUNCH12M_A           731  - 731  
 
 
         /* FDS  LOCATIONS */
         FDSRUNOUT_A           732  - 732      FDSLAST_A             733  - 733  
         FDSBALANCE_A          734  - 734      FDSSKIP_A             735  - 735  
         FDSSKIPDYS_A          736  - 737      FDSLESS_A             738  - 738  
         FDSHUNGRY_A           739  - 739      FDSWEIGHT_A           740  - 740  
         FDSNOTEAT_A           741  - 741      FDSNEDAYS_A           742  - 743  
         FDSCAT3_A             744  - 744      FDSCAT4_A             745  - 745  
 
 
         /* HOU  LOCATIONS */
         HOUYRSLIV_A           746  - 746      HOUTENURE_A           747  - 747  
         HOUGVASST_A           748  - 748  
         ;
 
    /* set variable labels */
    label 
         /* IDN  LABELS */
         RECTYPE              = "Record type"
         SRVY_YR              = "Year of the National Health Interview Survey"
         HHX                  = "Randomly assigned household number unique to a household"
         WTFA_A               = "Weight - Final Annual"
 
         /* UCF  LABELS */
         URBRRL               = "2013 NCHS Urban-Rural Classification Scheme for Counties"
         REGION               = "Household region"
         PSTRAT               = "Pseudo-stratum for public-use file variance estimation"
         PPSU                 = "Pseudo-PSU for public-use file variance estimation"
 
         /* FLG  LABELS */
         HHRESPSA_FLG         = "Sample Adult is the household respondent or the proxy who lives in the household"
 
         /* GEN  LABELS */
         INTV_QRT             = "Interview quarter"
         INTV_MON             = "Interview month"
         HHSTAT_A             = "Indicates person is the Sample Adult"
         ASTATNEW             = "Recoded ASTAT"
         AVAIL_A              = "Sample Adult Available"
         PROXY_A              = "Proxy Available"
         PROXYREL_A           = "Proxy's Relationship to Sample Adult"
 
         /* HHC  LABELS */
         AGEP_A               = "Age of SA (top coded)"
         AGE65                = "Age 65 or older"
         SEX_A                = "Sex of Sample Adult"
         EDUCP_A              = "Educational level of sample adult"
         AFNOW                = "Full-time active duty screener"
         HISP_A               = "Recode: Hispanic ethnicity of SA"
         HISPALLP_A           = "Single and multiple race groups with Hispanic origin"
         HISDETP_A            = "Hispanic origin detail"
         RACEALLP_A           = "Single and multiple race groups"
         PCNT18UPTC           = "Top-coded count of persons 18 or older in the household"
         PCNTLT18TC           = "Top-coded count of persons under 18 in the household"
 
         /* FAM  LABELS */
         PCNTADLT_A           = "Number of adults in Sample Adult family, top-coded 3+"
         PCNTKIDS_A           = "Number of children in Sample Adult family, top-coded 3+"
         OVER65FLG_A          = "Indicator for at least 1 person aged 65+ in SA family"
         MLTFAMFLG_A          = "Indicator for multifamily households"
         MAXEDUCP_A           = "Highest level of education of all the adults in the SA's family"
 
         /* HIS  LABELS */
         PHSTAT_A             = "General health status"
 
         /* LS3  LABELS */
         LSATIS11R_A          = "Life satisfaction - 11 category question"
         LSATIS4R_A           = "Life satisfaction - 4 category question"
         LSROTATE_FLG         = "Life Satisfaction section rotation flag"
 
         /* HYP  LABELS */
         HYPEV_A              = "Ever been told you had hypertension"
         HYPDIF_A             = "Told had hypertension on two or more visits"
         HYP12M_A             = "Hypertension, past 12 months"
         HYPMED_A             = "Now taking high blood pressure medication"
 
         /* CHL  LABELS */
         CHLEV_A              = "Ever told you had high cholesterol"
         CHL12M_A             = "High cholesterol, past 12 months"
         CHLMED_A             = "Now taking cholesterol medication"
 
         /* CVC  LABELS */
         CHDEV_A              = "Ever been told you had coronary heart disease"
         ANGEV_A              = "Ever been told you had angina"
         MIEV_A               = "Ever been told you had a heart attack"
         STREV_A              = "Ever been told you had a stroke"
 
         /* ASP  LABELS */
         ASPMEDEV_A           = "Told to take low-dose aspirin"
         ASPMEDNOWN_A         = "Now following aspirin advice"
         ASPMEDSTP_A          = "Advise to stop taking aspirin"
         ASPONOWN_A           = "Taking low dose-aspirin on own"
 
         /* AST  LABELS */
         ASEV_A               = "Ever had asthma"
         ASTILL_A             = "Still have asthma"
         ASAT12M_A            = "Asthma episode"
         ASER12M_A            = "Asthma ER visit"
 
         /* CAN  LABELS */
         CANEV_A              = "Ever been told you had cancer"
         BLADDCAN_A           = "Bladder cancer mentioned"
         BLADDAGETC_A         = "Age when first told had bladder cancer"
         BLOODCAN_A           = "Blood cancer mentioned"
         BLOODAGETC_A         = "Age when first told had blood cancer"
         BONECAN_A            = "Bone cancer mentioned"
         BONEAGETC_A          = "Age when first told had bone cancer"
         BRAINCAN_A           = "Brain cancer mentioned"
         BRAINAGETC_A         = "Age when first told had brain cancer"
         BREASCAN_A           = "Breast cancer mentioned"
         BREASAGETC_A         = "Age when first told had breast cancer"
         CERVICAN_A           = "Cervical cancer mentioned"
         CERVIAGETC_A         = "Age when first told had cervical cancer"
         COLONCAN_A           = "Colon cancer mentioned"
         COLONAGETC_A         = "Age when first told had colon cancer"
         ESOPHCAN_A           = "Esophageal cancer mentioned"
         ESOPHAGETC_A         = "Age when first told had esophageal cancer"
         GALLBCAN_A           = "Gallbladder cancer mentioned"
         GALLBAGETC_A         = "Age when first told had gallbladder cancer"
         LARYNCAN_A           = "Larynx-trachea cancer mentioned"
         LARYNAGETC_A         = "Age when first told had larynx-trachea cancer"
         LEUKECAN_A           = "Leukemia mentioned"
         LEUKEAGETC_A         = "Age when first told had leukemia"
         LIVERCAN_A           = "Liver cancer mentioned"
         LIVERAGETC_A         = "Age when first told had liver cancer"
         LUNGCAN_A            = "Lung cancer mentioned"
         LUNGAGETC_A          = "Age when first told had lung cancer"
         LYMPHCAN_A           = "Lymphoma cancer mentioned"
         LYMPHAGETC_A         = "Age when first told had lymphoma"
         MELANCAN_A           = "Melanoma cancer mentioned"
         MELANAGETC_A         = "Age when first told had melanoma cancer"
         MOUTHCAN_A           = "Mouth, tongue or lip cancer mentioned"
         MOUTHAGETC_A         = "Age when first told had mouth, tongue or lip cancer"
         OVARYCAN_A           = "Ovarian cancer mentioned"
         OVARYAGETC_A         = "Age when first told had ovarian cancer"
         PANCRCAN_A           = "Pancreatic cancer mentioned"
         PANCRAGETC_A         = "Age when first told had pancreatic cancer"
         PROSTCAN_A           = "Prostate cancer mentioned"
         PROSTAGETC_A         = "Age when first told had prostate cancer"
         RECTUCAN_A           = "Rectal cancer mentioned"
         RECTUAGETC_A         = "Age when first told had rectal cancer"
         SKNMCAN_A            = "Skin melanoma cancer mentioned"
         SKNMAGETC_A          = "Age when first told had skin melanoma cancer"
         SKNNMCAN_A           = "Skin non-melanoma cancer mentioned"
         SKNNMAGETC_A         = "Age when first told skin non-melanoma cancer"
         SKNDKCAN_A           = "Skin cancer (don't know what kind) mentioned"
         SKNDKAGETC_A         = "Age when first told had skin cancer (don't know what kind)"
         STOMACAN_A           = "Stomach cancer mentioned"
         STOMAAGETC_A         = "Age when first told had stomach cancer"
         THROACAN_A           = "Throat - pharynx cancer mentioned"
         THROAAGETC_A         = "Age when first told had throat-pharynx cancer"
         THYROCAN_A           = "Thyroid cancer mentioned"
         THYROAGETC_A         = "Age when first told had thyroid cancer"
         UTERUCAN_A           = "Uterine cancer mentioned"
         UTERUAGETC_A         = "Age when first told had uterine cancer"
         HDNCKCAN_A           = "Head and neck cancers mentioned"
         HDNCKAGETC_A         = "Age when first told had head or neck cancer"
         COLRCCAN_A           = "Colorectal cancer mentioned"
         COLRCAGETC_A         = "Age when first told had colon or rectal cancer"
         OTHERCANP_A          = "Other cancer mentioned"
         OTHERAGETC_A         = "Age when first told had other cancer"
         NUMCAN_A             = "Number of reported types of cancers"
 
         /* DIB  LABELS */
         PREDIB_A             = "Ever had prediabetes"
         GESDIB_A             = "Gestational diabetes"
         DIBEV_A              = "Ever had diabetes"
         DIBAGETC_A           = "Age first diagnosed w/diabetes"
         DIFYRSTC1_A          = "Years since first diagnosed w/diabetes"
         DIBPILL_A            = "Taking diabetic pills"
         DIBINS_A             = "Taking insulin"
         DIBINSTIME_A         = "Time from diabetes to insulin"
         DIBINSSTOP_A         = "Ever stop using insulin"
         DIBINSSTYR_A         = "Only stop insulin in first year"
         INSSKIP12M_A         = "Skipped insulin, past 12m"
         INSLESS12M_A         = "Took less insulin, past 12m"
         INSDLY12M_A          = "Delayed buying insulin, past 12m"
         DIBTYPE_A            = "Diabetes type"
         DIBSTRESS_A          = "Overwhelmed by diabetes"
         DIBCSTRESS_A         = "Change in diabetes distress"
 
         /* CON  LABELS */
         COPDEV_A             = "Ever been told you had COPD, emphysema, or chronic bronchitis?"
         ARTHEV_A             = "Ever had arthritis"
         DEMENEV_A            = "Ever had dementia"
         ANXEV_A              = "Ever had anxiety disorder"
         DEPEV_A              = "Ever had depression"
 
         /* RCN  LABELS */
         KIDWEAKEV_A          = "Ever had weak/failing kidneys"
         HEPEV_A              = "Ever had hepatitis"
         LIVEREV_A            = "Ever had cirrhosis/liver condition"
         CFSEV_A              = "Ever had Chronic Fatigue Syndrome"
         CFSNOW_A             = "Still have Chronic Fatigue Syndrome"
         COLDFLU12M_A         = "Cold or flu 12m"
         DRYMTH12M_A          = "Dry mouth 12m"
 
         /* ISN  LABELS */
         MEDRXTRT_A           = "Weakened immune system due to prescriptions"
         HLTHCOND_A           = "Weakened immune system due to health condition"
 
         /* EPI  LABELS */
         EPIEV_A              = "Ever had epilepsy"
         EPIMED_A             = "Take medication for epilepsy"
         EPINUMSEZP_A         = "How many seizures past 12 months"
         EPIDR_A              = "See a doctor for epilepsy"
 
         /* ALG  LABELS */
         CURRESP_A            = "Current respiratory allergy"
         DXRESP_A             = "Respiratory allergy diagnosis"
         CURFOOD_A            = "Current food allergy"
         DXFOOD_A             = "Food allergy diagnosis"
         CURSKIN_A            = "Current skin allergy"
         DXSKIN_A             = "Skin allergy diagnosis"
 
         /* BMI  LABELS */
         PREGNOW_A            = "Pregnant now"
         HEIGHTTC_A           = "Height without shoes (inches), public use"
         WEIGHTLBTC_A         = "Weight without shoes (pounds), public use"
         BMICAT_A             = "Categorical Body Mass Index, public use"
 
         /* VIS  LABELS */
         WEARGLSS_A           = "Wear glasses/contact lenses"
         VISIONDF_A           = "Difficulty seeing"
 
         /* HEA  LABELS */
         HEARAID_A            = "Use hearing aid"
         HEARAIDFR_A          = "How often use hearing aid"
         HEARINGDF_A          = "Difficulty hearing"
         HEARQTRM_A           = "Hearing conversation in quiet room"
         HEARNYRM_A           = "Hearing conversation in noisy room"
 
         /* MOB  LABELS */
         DIFF_A               = "Difficulty walking/steps"
         EQUIP_A              = "Use equipment to get around"
         WLK100_A             = "Difficulty walking 100 yards"
         WLK13M_A             = "Difficulty walking 1/3 mile"
         STEPS_A              = "Difficulty walking steps"
         CANEWLKR_A           = "Use cane or walker"
         WCHAIR_A             = "Use wheelchair/scooter"
         PERASST_A            = "Use someone's assistance"
         NOEQWLK100_A         = "Difficulty walking 100 yards without aid"
         NOEQWLK13M_A         = "Difficulty walking 1/3 mile without aid"
         NOEQSTEPS_A          = "Difficulty walking steps without equipment"
         EQWLK100_A           = "Difficulty walking 100 yards with aid"
         EQWLK13M_A           = "Difficulty walking 1/3 mile with aid"
         EQSTEPS_A            = "Difficulty walking steps with equipment"
 
         /* COM  LABELS */
         COMDIFF_A            = "Difficulty communicating"
         COMUSESL_A           = "Use sign language"
 
         /* COG  LABELS */
         COGMEMDFF_A          = "Difficulty remembering/concentrating"
         COGTYPEDFF_A         = "Remembering/concentrating or both"
         COGFRQDFF_A          = "Difficulty remembering-how often"
         COGAMTDFF_A          = "Difficulty remembering-how much"
 
         /* UPP  LABELS */
         UPPSLFCR_A           = "Difficulty with self care"
         UPPRAISE_A           = "Difficulty raising soda bottle"
         UPPOBJCT_A           = "Difficulty using hands and fingers"
         DISAB3_A             = "The Washington Group Short Set Composite Disability Indicator"
 
         /* SOC  LABELS */
         SOCERRNDS_A          = "Difficulty doing errands alone"
         SOCSCLPAR_A          = "Difficulty participating in social activities"
         SOCWRKLIM_A          = "Work limited due to health problem"
 
         /* ADO  LABELS */
         DEVDONSET_A          = "Difficulty doing activities before age 22"
 
         /* INS  LABELS */
         NOTCOV_A             = "Coverage status as used in Health United States"
         COVER_A              = "Health insurance hierarchy under 65"
         COVER65_A            = "Health Insurance hierarchy 65+"
         SINCOVDE_A           = "Single service plan - dental"
         SINCOVVS_A           = "Single service plan - vision"
         SINCOVRX_A           = "Single service plan - prescription"
         MEDICARE_A           = "Medicare recode"
         MCPART_A             = "Type of Medicare coverage"
         MCCHOICE_A           = "Enrolled in Medicare Advantage Plan"
         MCHMO_A              = "Medicare HMO"
         MCADVR_A             = "Medicare Advantage Plan"
         MCPARTD_A            = "Medicare Part D"
         MEDICAID_A           = "Medicaid recode"
         MAXCHNG_A            = "Medicaid through Marketplace"
         MAPREM_A             = "Medicaid premium"
         MADEDUC_A            = "Medicaid deductible"
         MAHDHP_A             = "Medicaid HDHP"
         MAFLG_A              = "Medicaid reassignment flag"
         PRIVATE_A            = "Private health insurance recode"
         EXCHANGE_A           = "Plan through Health Insurance Exchange, NCHS algorithm"
         POLHLD1_A            = "Policyholder for private plan 1"
         PRPLCOV1_A           = "Plan coverage for others - plan 1"
         PRPOLH1_A            = "Relation to policyholder - plan 1"
         PRPLCOV1_C_A         = "Response to PRPLCOV1_C or PRPLCOV2_C  from child - plan 1"
         PLNWRKR1_A           = "How plan was originally obtained - plan 1"
         PLNEXCHG1_A          = "Health plan obtained through Marketplace - plan 1"
         PLN1PAY1_A           = "Paid for by self or family - plan 1"
         PLN1PAY2_A           = "Paid for by employer or union - plan 1"
         PLN1PAY3_A           = "Paid for by someone outside the household - plan 1"
         PLN1PAY4_A           = "Paid for by Medicare - plan 1"
         PLN1PAY5_A           = "Paid for by Medicaid - plan 1"
         PLN1PAY6_A           = "Paid for by other government program - plan 1"
         HICOSTR1_A           = "Out-of-pocket premium cost - plan 1"
         PRDEDUC1_A           = "Deductible - plan 1"
         PRHDHP1_A            = "High deductible health plan - plan 1"
         HSAHRA1_A            = "Health Savings Accounts / Health Reimbursement Accounts - plan 1"
         PRRXCOV1_A           = "Plan pays for prescription drug - plan 1"
         PRDNCOV1_A           = "Plan pays for dental care - plan 1"
         PRVSCOV1_A           = "Plan pays for vision care - plan 1"
         EXCHPR1_A            = "Exchange company coding NCHS - plan 1"
         PRFLG_A              = "Private reassignment flag"
         PXCHNG1_A            = "Marketplace or state exchange, reassigned from public to private"
         PRPREM1_A            = "Premium on plan reassigned from public to private"
         PLEXCHPR1_A          = "Exchange company coding, NCHS, reassigned from public to private"
         POLHLD2_A            = "Policyholder for private plan 2"
         PRPLCOV2_A           = "Plan coverage for others - plan 2"
         PRPOLH2_A            = "Relation to policyholder - plan 2"
         PRPLCOV2_C_A         = "Response to PRPLCOV1_C or PRPLCOV2_C from child - plan 2"
         PLNWRKR2_A           = "How plan was originally obtained - plan 2"
         PLNEXCHG2_A          = "Health plan obtained through Marketplace - plan 2"
         PLN2PAY1_A           = "Paid for by self or family - plan 2"
         PLN2PAY2_A           = "Paid for by employer or union - plan 2"
         PLN2PAY3_A           = "Paid for by someone outside the household - plan 2"
         PLN2PAY4_A           = "Paid for by Medicare - plan 2"
         PLN2PAY5_A           = "Paid for by Medicaid - plan 2"
         PLN2PAY6_A           = "Paid for by other government program - plan 2"
         HICOSTR2_A           = "Out-of-pocket premium cost - plan 2"
         PRDEDUC2_A           = "Deductible - plan 2"
         PRHDHP2_A            = "High deductible health plan - plan 2"
         HSAHRA2_A            = "Health Savings Accounts / Health Reimbursement Accounts - plan 2"
         PRRXCOV2_A           = "Plan pays for prescription drug - plan 2"
         PRDNCOV2_A           = "Plan pays for dental care - plan 2"
         PRVSCOV2_A           = "Plan pays for vision care - plan 2"
         EXCHPR2_A            = "Exchange company coding NCHS - plan 2"
         CHIP_A               = "Children's Health Insurance Program (CHIP) recode"
         CHXCHNG_A            = "CHIP through Marketplace"
         CHPREM_A             = "Pay CHIP premium"
         CHDEDUC_A            = "CHIP deductible"
         CHHDHP_A             = "CHIP HDHP"
         CHFLG_A              = "CHIP reassignment flag"
         OTHPUB_A             = "State-sponsored health plan recode"
         OPXCHNG_A            = "State-sponsored plan through Marketplace"
         OPPREM_A             = "Pay premium for state-sponsored plan"
         OPDEDUC_A            = "State-sponsored plan deductible"
         OPHDHP_A             = "State-sponsored plan HDHP"
         PLEXCHOP_A           = "Exchange company coding, NCHS (state-sponsored plan)"
         OPFLG_A              = "State-sponsored reassignment flag"
         OTHGOV_A             = "Other government program recode"
         OGXCHNG_A            = "Other government program through Marketplace"
         OGPREM_A             = "Pay premium for other government program"
         OGDEDUC_A            = "Other government program deductible"
         OGHDHP_A             = "Other government program HDHP"
         PLEXCHOG_A           = "Exchange company coding, NCHS (other government program)"
         OGFLG_A              = "Other government reassignment flag"
         MILITARY_A           = "Military health care coverage recode"
         MILSPC1R_A           = "Types of military health care - VA health care"
         MILSPC2_A            = "Types of military health care - TRICARE"
         MILSPC3_A            = "Types of military health care - CHAMP-VA"
         IHS_A                = "Indian Health Service recode"
         HILAST_A             = "How long since last health coverage"
         HILASTMY_A           = "Number of months without coverage"
         HISTOPJOB_A          = "Lost job or changed employers"
         HISTOPMISS_A         = "Missed deadline"
         HISTOPAGE_A          = "Ineligible because of age/left school"
         HISTOPCOST_A         = "Cost increase"
         HISTOPELIG_A         = "Not eligible for Medicaid, CHIP, or other public coverage"
         RSNHICOST_A          = "Not affordable"
         RSNHIWANT_A          = "Do not need or want coverage"
         RSNHIELIG_A          = "Not eligible for coverage"
         RSNHICONF_A          = "Signing up too difficult or confusing"
         RSNHIMEET_A          = "Cannot find a plan that meets the needs"
         RSNHIWAIT_A          = "Coverage has not started yet"
         RSNHIOTH_A           = "Another reason"
         RSNHIJOB_A           = "Lost job"
         RSNHIMISS_A          = "Missed deadline"
         HINOTYR_A            = "No health coverage during the past 12 months"
         HINOTMYR_A           = "Months without coverage in the past 12 months"
         MILSPC1_A            = "Types of military health care - VA health care original response"
         HICOV_A              = "Have health insurance"
         HIKIND01_A           = "Kind(s) of health insurance - private health insurance"
         HIKIND02_A           = "Kind(s) of health insurance - Medicare"
         HIKIND03_A           = "Kind(s) of health insurance - Medicare supplement (Medigap)"
         HIKIND04_A           = "Kind(s) of health insurance - Medicaid"
         HIKIND05_A           = "Kind(s) of health insurance - CHIP"
         HIKIND06_A           = "Kind(s) of health insurance - military related health care"
         HIKIND07_A           = "Kind(s) of health insurance - Indian Health Service"
         HIKIND08_A           = "Kind(s) of health insurance - State-sponsored health plan"
         HIKIND09_A           = "Kind(s) of health insurance - Other government program"
         HIKIND10_A           = "Kind(s) of health insurance - No coverage of any type"
         MCAREPRB_A           = "Medicare coverage probe"
         MCAIDPRB_A           = "Medicaid coverage probe"
 
         /* PAY  LABELS */
         PAYBLL12M_A          = "Problems paying medical bills, past 12m"
         PAYNOBLLNW_A         = "Unable to pay medical bills"
         PAYWORRY_A           = "Get sick or have accident, worry about paying medical bills"
 
         /* CVD  LABELS */
         CVDDIAG_A            = "Ever had COVID-19"
         COVIDTEST_A          = "Ever been tested for COVID-19"
         CVDRSLT_A            = "Tested positive for COVID-19"
         CVDSEV_A             = "Symptoms of COVID-19"
 
         /* TSC  LABELS */
         CVDSYMSM_A           = "COVID-19 symptom - loss of smell"
         CVDSMREC_A           = "COVID-19 symptom - smell recovery"
         CVDSYMTST_A          = "COVID-19 symptom - loss of taste"
         CVDTSTREC_A          = "COVID-19 symptom - taste recovery"
 
         /* UTZ  LABELS */
         LASTDR_A             = "Time since last saw doctor"
         WELLNESS_A           = "Was last visit a wellness visit"
         WELLVIS_A            = "Time since last wellness visit"
         USUALPL_A            = "Have a usual place to go for care"
         USPLKIND_A           = "Type of place for usual care"
         URGNT12MTC_A         = "Number of times visited urgent care, past 12m, top-coded"
         EMERG12MTC_A         = "Number of times visited hospital emergency room, past 12m, top-coded"
         HOSPONGT_A           = "Hospitalized overnight, past 12m"
         MEDDL12M_A           = "Delayed medical care due to cost, past 12m"
         MEDNG12M_A           = "Needed medical care but did not get it due to cost, past 12m"
 
         /* ACC  LABELS */
         DLYCARE_A            = "Delayed medical care due to COVID-19"
         DNGCARE_A            = "Did not get medical care due to COVID-19"
         VIRAPP12M_A          = "Virtual medical appointment, past 12m"
         VIRAPPCVD_A          = "Virtual medical appointment related to COVID-19"
 
         /* CNV  LABELS */
         CANCOVTREA_A         = "Cancer treatment since the start of the coronavirus pandemic"
         CANCOVCHG_A          = "Cancer treatment changed, delayed or cancelled due to the coronavirus pandemic"
         CANCOVOTH_A          = "Other cancer medical care since the start of the coronavirus pandemic"
         CANCOVCARE_A         = "Other cancer care changed, delayed, or cancelled due to coronavirus pandemic"
 
         /* PMD  LABELS */
         RX12M_A              = "Took prescription medication, past 12m"
         RXSK12M_A            = "Skipped medication doses to save money, past 12m"
         RXLS12M_A            = "Took less medication to save money, past 12m"
         RXDL12M_A            = "Delayed filling prescription to save money, past 12m"
         RXDG12M_A            = "Needed prescription medication but did not get it due to cost, past 12m"
 
         /* PRV  LABELS */
         BPLAST_A             = "Last time blood pressure checked"
         CHOLLAST_A           = "Last time cholesterol checked"
         DIBLAST1_A           = "Last time blood sugar test"
         DIBA1CLAST_A         = "Last A1C"
         DIBA1CNMT_A          = "Number of A1Cs - topcoded"
         COLORECTEV_A         = "Colonoscopy or sigmoidoscopy"
         COLORECTYP_A         = "Colonoscopy or sigmoidoscopy or both"
         COLWHEN_A            = "Most recent colonoscopy"
         COLREASON_A          = "Why did you have a colonoscopy"
         COLPAY_A             = "Pay for most recent colonoscopy"
         COLSIGWHEN_A         = "Most recent colonoscopy or sigmoidoscopy"
         SIGWHEN_A            = "Most recent sigmoidoscopy"
         CTCOLEV1_A           = "Ever had colonography/virtual colonoscopy"
         CTCOLWHEN1_A         = "Most recent colonography/virtual colonoscopy"
         FITHEV1_A            = "Ever had home blood stool test"
         FITHWHEN1_A          = "Most recent home blood stool test"
         COLOGUARD1_A         = "Ever had Cologuard"
         FITCOLG1_A           = "Was blood stool/FIT part of Cologuard test?"
         CGUARDWHE1_A         = "When was your last Cologuard?"
         COLPROB1_A           = "Did doctor recommend you be tested to look for problems in colon/rectum"
         COLTEST1_A           = "Stool blood test/fecal occult blood/FIT test"
         COLTEST2_A           = "Cologuard or FIT DNA test"
         COLTEST3_A           = "Sigmoidoscopy"
         COLTEST4_A           = "Colonoscopy"
         COLTEST5_A           = "CT colonography/virtual colonoscopy"
         COLTEST6_A           = "Other test for colon cancer"
         PSATEST_A            = "Ever had a PSA test"
         PSAWHEN_A            = "When had most recent PSA test"
         PSAREASON_A          = "Reason had a PSA test"
         PSASUGGEST_A         = "Who suggested PSA test"
         CERVICEV1_A          = "Ever had cervical cancer screening test"
         CERVICWHEN_A         = "When was most recent cervical cancer test"
         CERREASON1_A         = "Reason for cervical cancer screening"
         PAPTEST_A            = "PAP test at most recent cervical cancer screening"
         HPVTEST_A            = "HPV test at most recent cervical cancer screening"
         TELLCERVIC_A         = "Doctor tell type of cervical exam"
         CERVICRES_A          = "Abnormal pap in past 5 years"
         CERVICNOT1_A         = "Why did not get a PAP/HPV test in past 5 years"
         HYSTEV1_A            = "Had hysterectomy"
         MAMEV_A              = "Ever had mammogram"
         MAMWHEN_A            = "Most recent mammogram"
         MAMPAY_A             = "Pay mammogram"
         MAMREASON_A          = "Reason for mammogram"
         MAMAGE1ST1_A         = "Age of first mammogram"
         MAMNOT1_A            = "Reason no mammogram"
 
         /* IMS  LABELS */
         PREGFLUYR_A          = "Was SA pregnant last flu season"
         LIVEBIRTH_A          = "Any live births"
         SHTFLU12M_A          = "Flu vaccine, past 12 months"
         SHTFLUM_A            = "Month of last flu vaccine"
         SHTFLUY_A            = "Year of last flu vaccine"
         FLUPREG_A            = "Was flu shot before or during pregnancy"
         FLUPREG2_A           = "Earlier pregnancy and flu vaccine"
         SHTCVD19_A           = "COVID-19 vaccination"
         SHTCVD19NM_A         = "Number of COVID-19 vaccinations"
         CVDVAC1MR_A          = "Month of most recent COVID-19 vaccination"
         CVDVAC1YR_A          = "Year of most recent COVID-19 vaccination"
         CVDVAC2MR_A          = "Month of next most recent COVID-19 vaccination"
         CVDVAC2YR_A          = "Year of next most recent COVID-19 vaccination"
         SHTCVD19AV_A         = "Doctor told need another COVID-19 vaccination"
         SHTPNUEV_A           = "Ever had pneumonia shot"
         SHTPNEUNB_A          = "Number of pneumonia shots"
         SHTSHINGLE_A         = "Ever had a shingles vaccination"
         ZOSTAVAX1_A          = "Ever had Zostavax"
         ZOSTAVXYRP_A         = "When was most recent Zostavax shot"
         ZOSTAWHEN_A          = "Was Zostavax before 2018"
         SHINGRIX1_A          = "Ever had Shingrix vaccination"
         SHINGRIXNB_A         = "How many Shingrix shots"
         SHINGRXYRP_A         = "What year did you get your most recent Shingrix shot"
         SHINGWHEN_A          = "Was last Shingrix before 2018"
         TDAPPREG_A           = "Have a Tdap booster shot"
         SHTHEPB_A            = "Ever receive hepatitis B vaccine"
         SHTHEPA_A            = "Ever receive hepatitis A vaccine"
         LIVEHEP_A            = "Live with someone with hepatitis"
         WORKHEALTH_A         = "Currently provide medical care to patients"
         WRKHLTHFC_A          = "Currently volunteer or work in health care"
         TRAVEL_A             = "Travel to other countries since 1995"
 
         /* CGR  LABELS */
         HOMEHC12M_A          = "Received care at home, past 12m"
         HOMECAREDG_A         = "Did not get home care due to COVID-19"
         FAMCARE12M_A         = "Received home care from friend/family"
         FAMCAREDNG_A         = "Did not get family care due to COVID-19"
         FAMCARECVD_A         = "Received family care due to COVID-19"
 
         /* ANX  LABELS */
         ANXFREQ_A            = "How often feel worried, nervous, or anxious"
         ANXMED_A             = "Take medication for worried/nervous/anxious feelings"
         ANXLEVEL_A           = "Level of feelings when last felt worried/nervous/anxious"
 
         /* DEP  LABELS */
         DEPFREQ_A            = "How often depressed"
         DEPMED_A             = "Take medication for depression"
         DEPLEVEL_A           = "Level of how depressed"
 
         /* MHC  LABELS */
         MHRX_A               = "Took medicine for other emotions/concentration/behavior/mental health, past 12m"
         MHTHRPY_A            = "Received counseling/therapy from mental health professional, past 12m"
         MHTPYNOW_A           = "Currently receiving counseling/therapy from mental health professional"
         MHTHDLY_A            = "Delayed counseling/therapy due to cost, past 12m"
         MHTHND_A             = "Needed counseling/therapy but did not get it due to cost, past 12m"
 
         /* SPD  LABELS */
         SAD_A                = "How often felt so sad nothing cheers you up, past 30 days"
         NERVOUS_A            = "How often felt nervous, past 30 days"
         RESTLESS_A           = "How often felt restless/fidgety, past 30 days"
         HOPELESS_A           = "How often felt hopeless, past 30 days"
         EFFORT_A             = "How often felt everything was an effort, past 30 days"
         WORTHLESS_A          = "How often felt worthless, past 30 days"
         K6SPD_A              = "Experienced serious psychological distress - K6 scale"
 
         /* PAI  LABELS */
         PAIFRQ3M_A           = "How often had pain"
         PAIAMNT_A            = "How much pain last time"
         PAIWKLM3M_A          = "How often pain limits life/work"
         PAIAFFM3M_A          = "How often pain impacts family"
         PAIBACK3M_A          = "Back pain"
         PAIULMB3M_A          = "Pain in hands"
         PAILLMB3M_A          = "Pain in hips"
         PAIHDFC3M_A          = "Migraine"
         PAIAPG3M_A           = "Abdominal pain"
         PAITOOTH3M_A         = "Toothache/jaw pain"
 
         /* REP  LABELS */
         REPSTRAIN_A          = "Repetitive strain injuries in the past 3 months"
         REPLIMIT_A           = "Limited by repetitive strain injury in the past 3 months"
         REPSAWDOC_A          = "Saw a doctor about repetitive strain injury"
         REPWRKDYTC_A         = "Number of workdays missed due to repetitive strain injury in the past 3 months"
         REPFUTWRK_A          = "Expected workdays missed due to repetitive strain injury"
         REPSTOPCHG_A         = "Stopped working or changed job due to repetitive strain injury"
         REPREDUCE_A          = "Reduced work or changed tasks due to repetitive strain injury"
         REPWRKCAUS_A         = "Did repetitive strain injury occur while working"
 
         /* INJ  LABELS */
         ANYINJURY_A          = "Any injury in the past 3 months (not including repetitive strain injuries)"
         INJLIMIT_A           = "Limited by injury in the past 3 months"
         NUMINJTC_A           = "Number of non-repetitive strain injuries in the past 3 months"
         INJHOME_A            = "Did injury occur at home"
         INJWORK_A            = "Did injury occur at work"
         INJSPORTS_A          = "Did injury occur while playing sports or exercising"
         INJFALL_A            = "Did injury occur because of a fall"
         INJFALLHOM_A         = "Did fall occur at home"
         INJFALLWRK_A         = "Did fall occur at work"
         INJMOTOR_A           = "Injury caused by a motor vehicle crash or collision"
         INJMVTYPE1_A         = "Motor vehicle accident - driver"
         INJMVTYPE2_A         = "Motor vehicle accident - passenger"
         INJMVTYPE3_A         = "Motor vehicle accident - bicyclist"
         INJMVTYPE4_A         = "Motor vehicle accident - pedestrian"
         INJMVTYPE5_A         = "Motor vehicle accident - something else"
         INJCHORES_A          = "Did injury occur while doing household activities"
         INJSAWDOC_A          = "Saw a doctor about injury"
         INJER_A              = "Visited ER for injury"
         INJHOSP_A            = "Hospitalized for injury"
         INJBONES_A           = "Did injury cause broken bones"
         INJSTITCH_A          = "Did injury require stitches or staples"
         INJWRKDYTC_A         = "Number of workdays missed due to injury in the past 3 months"
         INJFUTWRK_A          = "Expected workdays missed due to injury"
         INJSTOPCHG_A         = "Stopped working or changed jobs due to injury"
         INJREDUCE_A          = "Reduced work or changed tasks due to injury"
 
         /* TSM  LABELS */
         SMELLDF_A            = "Difficulty smelling"
         SMELLCOMP_A          = "Smelling compared to past"
         SMELLPHT_A           = "Smell unpleasant odor"
         TASTEDF_A            = "Difficulty tasting"
         TASTECOMP_A          = "Tasting compared to past"
         TASTEFLAV_A          = "Tasting flavors"
         TASTEUNW_A           = "Unwanted taste"
         TSTSMHP_A            = "Ever discuss problem with smell/taste with doctor"
         TSTSMLAST_A          = "Last time you discuss problem with smell/taste with doctor"
 
         /* CIG  LABELS */
         SMKEV_A              = "Ever smoked 100 cigarettes"
         SMKNOW_A             = "Now smoke cigarettes"
         SMKCIGST_A           = "Cigarette smoking status"
         CIGNOW_A             = "Number of cigarettes a day"
         SMK30D_A             = "Number of days smoked past month"
         CIG30D_A             = "Number of cigarettes on days smoked past month"
         ECIGEV_A             = "Ever used electronic cigarettes"
         ECIGNOW_A            = "Now use electronic cigarettes"
         SMKECIGST_A          = "Electronic cigarette use status"
 
         /* OTB  LABELS */
         CIGAREV_A            = "Ever smoked a cigar"
         CIGARCUR_A           = "Now smoke cigars"
         CIGAR30D_A           = "How many days smoked a cigar, past 30 days"
         PIPEEV_A             = "Ever smoked a pipe filled with tobacco"
         PIPECUR_A            = "Now smoked pipe filled with tobacco"
         SMOKELSEV_A          = "Ever used smokeless tobacco"
         SMOKELSCUR_A         = "Now use smokeless tobacco"
 
         /* SOS  LABELS */
         SUPPORT_A            = "How often social/emotional support"
         CMPSUPPORT_A         = "Social/emotional support, past 12 months"
 
         /* ORN  LABELS */
         ORIENT_A             = "Sexual orientation"
 
         /* MAR  LABELS */
         MARITAL_A            = "Sample adult's current marital status"
         SPOUSLIV_A           = "Sample adult's spouse lives here"
         SPOUSEP_A            = "Sample adult's spouse does not reside here due to legal separation"
         EVRMARRIED_A         = "Sample adult has ever been married"
         MARSTAT_A            = "Current marital status of sample adult"
         LEGMSTAT_A           = "Legal marital status of sample adult"
         SPOUSESEX_A          = "Sex of sample adult's spouse"
         SASPPRACE_A          = "Race of sample adult and spouse or partner are the same"
         SASPPHISP_A          = "Hispanic ethnicity of sample adult and spouse or partner are the same"
         SPOUSAGETC_A         = "Age of sample adult's spouse, top-coded"
         SPOUSEDUCP_A         = "Education level of sample adult's spouse"
         SPOUSWRK_A           = "Working status of sample adult's spouse"
         SPOUSWKFT_A          = "Sample adult's spouse is working full-time"
         PRTNRSEX_A           = "Sex of the sample adult's partner"
         PRTNRAGETC_A         = "Age of sample adult's partner, top-coded"
         PRTNREDUCP_A         = "Education level of sample adult's partner"
         PRTNRWRK_A           = "Working status of sample adult's partner"
         PRTNRWKFT_A          = "Sample adult's partner is working full-time"
         SAPARENTSC_A         = "Sample adult relationship to sample child"
         PARSTAT_A            = "Parental Status of sample adult"
 
         /* VET  LABELS */
         AFVET_A              = "Ever serve active duty military"
         AFVETTRN_A           = "Reserves or National Guard"
         COMBAT_A             = "Ever served abroad during armed conflict"
         VADISB_A             = "Have VA disability rating"
         VAHOSP_A             = "Receive care at VA facility"
         VACAREEV_A           = "Ever use VA health care"
 
         /* NAT  LABELS */
         NATUSBORN_A          = "Born in U.S. or U.S. territory"
         YRSINUS_A            = "Years that sample adult has been in the United States"
         CITZNSTP_A           = "Citizenship status"
 
         /* SCH  LABELS */
         SCHCURENR_A          = "Currently in school"
         SCHDYMSSTC_A         = "Days missed due to illness/injury, past 12 m"
 
         /* EMP  LABELS */
         EMPWRKLSW1_A         = "Worked last week"
         EMPWHYNOT_A          = "Main reason not working"
         EMPLSTWOR1_A         = "Last time worked for pay"
         EMPWKHRS3_A          = "Hours worked per week (topcoded for Public Use)"
         EMPWRKFT1_A          = "Usually work 35+ hours per week"
         EMPSICKLV_A          = "Paid sick leave"
         EMPHEALINS_A         = "Health insurance offered"
         EMPDYSMSS3_A         = "Days missed work, past 12 months (top-coded)"
 
         /* EMD  LABELS */
         EMDINDSTN1_A         = "Detailed 2-digit recode for sample adult's industry"
         EMDINDSTN2_A         = "Simple 2-digit recode for sample adult's industry"
         EMDOCCUPN1_A         = "Detailed 2-digit recode for sample adult's occupation"
         EMDOCCUPN2_A         = "Simple 2-digit recode for sample adult's occupation"
         EMDSUPER_A           = "Supervise other employees"
         EMDWRKCAT1_A         = "Type of main job"
 
         /* JOB  LABELS */
         JOBTAX_A             = "Does employer deduct taxes?"
         JOBCHGEARN_A         = "How much do your earnings change monthly"
         JOBSHIFT_A           = "Usual hours of main job"
         JOBCHGSCH_A          = "How easy to change work schedule"
         JOBVARYSCH_A         = "How much does schedule vary"
         JOBADVSCH_A          = "Advance notice of work schedule"
         JOBLKYLOSS_A         = "Likely job loss"
         JOBWRKSICK_A         = "Days worked while sick"
         JOBMISS_A            = "Days of work missed while sick"
 
         /* SDW  LABELS */
         CURJOBSD1_A          = "Current job - Social distancing at work"
         WRKCLSSD1_A          = "Current job - Work close to others with social distancing in effect"
         WRKCLSNSD1_A         = "Current job - Work close to others when social distancing not in effect"
         WRKCLSOFT1_A         = "Current job - How often work close to others"
         SDMSRS1_A            = "Current job - Social distancing measures since coronavirus pandemic"
         SDMSRSOFT1_A         = "Current job - Work close to others when social distancing measures in effect"
         RECJOBSD1_A          = "Recent job - Social distancing at work"
         JOBANYSD1_A          = "Current or recent job - Social distancing at any time"
         RJCLSSD1_A           = "Recent job - Work close to others with social distancing in effect"
         CLSWRKSD1_A          = "Current or recent job - Work close to others with social distancing in effect"
         RJCLSNOSD1_A         = "Recent job - Work close to others when social distancing not in effect"
         RJCLSOFT1_A          = "Recent job - How often work close to others"
         CLSWRKNOS1_A         = "Current or recent job - Work close to others when no social distancing measures"
 
         /* FEM  LABELS */
         PCNTADTWKP_A         = "Number of adults in sample adult's family who are working"
         PCNTADTWFP_A         = "Number of adults in sample adult's family who are working full-time"
 
         /* INC  LABELS */
         INCWRKO_A            = "Income from wages"
         INCINTER_A           = "Income from accounts"
         INCSSRR_A            = "Income from SS/Railroad Retirement"
         INCSSISSDI_A         = "Family income from SSDI"
         SSISSDIBTH_A         = "Which family income SSI/SSDI"
         SSISSDIDSB_A         = "SSI/SSDI due to disability"
         INCWELF_A            = "Income from public assistance"
         INCRETIRE_A          = "Income from retirement"
         INCOTHR_A            = "Income from other sources"
         IMPNUM_A             = "Imputation number"
         POVRATTC_A           = "SA family poverty ratio (top-coded)"
         RATCAT_A             = "Ratio of family income to poverty threshold for SA's family"
         IMPINCFLG_A          = "Imputed SA family income imputation flag"
 
         /* FOO  LABELS */
         FSNAP12M_A           = "Receive food stamps, past 12m"
         FSNAP30D_A           = "Receive food stamps, past 30d"
         FWIC12M_A            = "Receive WIC benefits, past 12m"
         FLUNCH12M_A          = "Receive free/reduced meals at school"
 
         /* FDS  LABELS */
         FDSRUNOUT_A          = "Worry food would run out"
         FDSLAST_A            = "Food didn't last"
         FDSBALANCE_A         = "Couldn't afford to eat balanced meals"
         FDSSKIP_A            = "Cut the size of meals or skip meals"
         FDSSKIPDYS_A         = "How many days did you/adults in the family cut the size of meals or skip meals"
         FDSLESS_A            = "Eat less than should"
         FDSHUNGRY_A          = "Ever hungry because not enough money for food"
         FDSWEIGHT_A          = "Lose weight because not enough money for food"
         FDSNOTEAT_A          = "Not eat for a whole day"
         FDSNEDAYS_A          = "How many days not eat"
         FDSCAT3_A            = "Adult 3 category food security recode"
         FDSCAT4_A            = "Adult  4 category food security recode"
 
         /* HOU  LABELS */
         HOUYRSLIV_A          = "Length of time in house/apartment"
         HOUTENURE_A          = "Residence owned/rented"
         HOUGVASST_A          = "Paying lower rent"
    ;
 
    /*
     Associate variables with format values.
        Put asterisk(*) before word "format"
        in the next statement to prevent format
        associations being stored with datatset.
    */
    format 
         /* IDN  FORMAT ASSOCIATIONS */
         RECTYPE           SA054X.   SRVY_YR           SA061X. 
 
         /* UCF  FORMAT ASSOCIATIONS */
         URBRRL            SA063X.   REGION            SA055X. 
 
         /* FLG  FORMAT ASSOCIATIONS */
         HHRESPSA_FLG      SA067X. 
 
         /* GEN  FORMAT ASSOCIATIONS */
         INTV_QRT          SA031X.   INTV_MON          SA030X.   HHSTAT_A          SA024X.
         ASTATNEW          SA139X.   AVAIL_A           SA131X.   PROXY_A           SA147X.
         PROXYREL_A        SA125X. 
 
         /* HHC  FORMAT ASSOCIATIONS */
         AGEP_A            SA003X.   AGE65             SA070X.   SEX_A             SA135X.
         EDUCP_A           SA092X.   AFNOW             SA147X.   HISP_A            SA147X.
         HISPALLP_A        SA027X.   HISDETP_A         SA026X.   RACEALLP_A        SA052X.
         PCNT18UPTC        SA045X.   PCNTLT18TC        SA047X. 
 
         /* FAM  FORMAT ASSOCIATIONS */
         PCNTADLT_A        SA046X.   PCNTKIDS_A        SA047X.   OVER65FLG_A       SA040X.
         MLTFAMFLG_A       SA039X.   MAXEDUCP_A        SA092X. 
 
         /* HIS  FORMAT ASSOCIATIONS */
         PHSTAT_A          SA122X. 
 
         /* LS3  FORMAT ASSOCIATIONS */
         LSATIS11R_A       SA133X.   LSATIS4R_A        SA132X.   LSROTATE_FLG      SA110X. 
 
         /* HYP  FORMAT ASSOCIATIONS */
         HYPEV_A           SA147X.   HYPDIF_A          SA147X.   HYP12M_A          SA147X.
         HYPMED_A          SA147X. 
 
         /* CHL  FORMAT ASSOCIATIONS */
         CHLEV_A           SA147X.   CHL12M_A          SA147X.   CHLMED_A          SA147X. 
 
         /* CVC  FORMAT ASSOCIATIONS */
         CHDEV_A           SA147X.   ANGEV_A           SA147X.   MIEV_A            SA147X.
         STREV_A           SA147X. 
 
         /* ASP  FORMAT ASSOCIATIONS */
         ASPMEDEV_A        SA147X.   ASPMEDNOWN_A      SA147X.   ASPMEDSTP_A       SA147X.
         ASPONOWN_A        SA147X. 
 
         /* AST  FORMAT ASSOCIATIONS */
         ASEV_A            SA147X.   ASTILL_A          SA147X.   ASAT12M_A         SA147X.
         ASER12M_A         SA147X. 
 
         /* CAN  FORMAT ASSOCIATIONS */
         CANEV_A           SA147X.   BLADDCAN_A        SA038X.   BLADDAGETC_A      SA002X.
         BLOODCAN_A        SA038X.   BLOODAGETC_A      SA002X.   BONECAN_A         SA038X.
         BONEAGETC_A       SA002X.   BRAINCAN_A        SA038X.   BRAINAGETC_A      SA002X.
         BREASCAN_A        SA038X.   BREASAGETC_A      SA005X.   CERVICAN_A        SA038X.
         CERVIAGETC_A      SA005X.   COLONCAN_A        SA038X.   COLONAGETC_A      SA002X.
         ESOPHCAN_A        SA038X.   ESOPHAGETC_A      SA002X.   GALLBCAN_A        SA038X.
         GALLBAGETC_A      SA002X.   LARYNCAN_A        SA038X.   LARYNAGETC_A      SA002X.
         LEUKECAN_A        SA038X.   LEUKEAGETC_A      SA002X.   LIVERCAN_A        SA038X.
         LIVERAGETC_A      SA002X.   LUNGCAN_A         SA038X.   LUNGAGETC_A       SA002X.
         LYMPHCAN_A        SA038X.   LYMPHAGETC_A      SA002X.   MELANCAN_A        SA038X.
         MELANAGETC_A      SA002X.   MOUTHCAN_A        SA038X.   MOUTHAGETC_A      SA002X.
         OVARYCAN_A        SA038X.   OVARYAGETC_A      SA002X.   PANCRCAN_A        SA038X.
         PANCRAGETC_A      SA002X.   PROSTCAN_A        SA038X.   PROSTAGETC_A      SA005X.
         RECTUCAN_A        SA038X.   RECTUAGETC_A      SA002X.   SKNMCAN_A         SA038X.
         SKNMAGETC_A       SA005X.   SKNNMCAN_A        SA038X.   SKNNMAGETC_A      SA005X.
         SKNDKCAN_A        SA038X.   SKNDKAGETC_A      SA005X.   STOMACAN_A        SA038X.
         STOMAAGETC_A      SA002X.   THROACAN_A        SA038X.   THROAAGETC_A      SA002X.
         THYROCAN_A        SA038X.   THYROAGETC_A      SA002X.   UTERUCAN_A        SA038X.
         UTERUAGETC_A      SA002X.   HDNCKCAN_A        SA038X.   HDNCKAGETC_A      SA002X.
         COLRCCAN_A        SA038X.   COLRCAGETC_A      SA002X.   OTHERCANP_A       SA038X.
         OTHERAGETC_A      SA005X.   NUMCAN_A          SA118X. 
 
         /* DIB  FORMAT ASSOCIATIONS */
         PREDIB_A          SA147X.   GESDIB_A          SA147X.   DIBEV_A           SA147X.
         DIBAGETC_A        SA002X.   DIFYRSTC1_A       SA015X.   DIBPILL_A         SA147X.
         DIBINS_A          SA147X.   DIBINSTIME_A      SA087X.   DIBINSSTOP_A      SA147X.
         DIBINSSTYR_A      SA147X.   INSSKIP12M_A      SA147X.   INSLESS12M_A      SA147X.
         INSDLY12M_A       SA147X.   DIBTYPE_A         SA088X.   DIBSTRESS_A       SA140X.
         DIBCSTRESS_A      SA120X. 
 
         /* CON  FORMAT ASSOCIATIONS */
         COPDEV_A          SA147X.   ARTHEV_A          SA147X.   DEMENEV_A         SA147X.
         ANXEV_A           SA147X.   DEPEV_A           SA147X. 
 
         /* RCN  FORMAT ASSOCIATIONS */
         KIDWEAKEV_A       SA147X.   HEPEV_A           SA147X.   LIVEREV_A         SA147X.
         CFSEV_A           SA147X.   CFSNOW_A          SA147X.   COLDFLU12M_A      SA147X.
         DRYMTH12M_A       SA147X. 
 
         /* ISN  FORMAT ASSOCIATIONS */
         MEDRXTRT_A        SA147X.   HLTHCOND_A        SA147X. 
 
         /* EPI  FORMAT ASSOCIATIONS */
         EPIEV_A           SA147X.   EPIMED_A          SA147X.   EPINUMSEZP_A      SA096X.
         EPIDR_A           SA147X. 
 
         /* ALG  FORMAT ASSOCIATIONS */
         CURRESP_A         SA147X.   DXRESP_A          SA147X.   CURFOOD_A         SA147X.
         DXFOOD_A          SA147X.   CURSKIN_A         SA147X.   DXSKIN_A          SA147X. 
 
         /* BMI  FORMAT ASSOCIATIONS */
         PREGNOW_A         SA147X.   HEIGHTTC_A        SA006X.   WEIGHTLBTC_A      SA033X.
         BMICAT_A          SA007X. 
 
         /* VIS  FORMAT ASSOCIATIONS */
         WEARGLSS_A        SA147X.   VISIONDF_A        SA089X. 
 
         /* HEA  FORMAT ASSOCIATIONS */
         HEARAID_A         SA147X.   HEARAIDFR_A       SA100X.   HEARINGDF_A       SA089X.
         HEARQTRM_A        SA089X.   HEARNYRM_A        SA089X. 
 
         /* MOB  FORMAT ASSOCIATIONS */
         DIFF_A            SA089X.   EQUIP_A           SA147X.   WLK100_A          SA089X.
         WLK13M_A          SA089X.   STEPS_A           SA089X.   CANEWLKR_A        SA147X.
         WCHAIR_A          SA147X.   PERASST_A         SA147X.   NOEQWLK100_A      SA089X.
         NOEQWLK13M_A      SA089X.   NOEQSTEPS_A       SA089X.   EQWLK100_A        SA089X.
         EQWLK13M_A        SA089X.   EQSTEPS_A         SA089X. 
 
         /* COM  FORMAT ASSOCIATIONS */
         COMDIFF_A         SA089X.   COMUSESL_A        SA147X. 
 
         /* COG  FORMAT ASSOCIATIONS */
         COGMEMDFF_A       SA089X.   COGTYPEDFF_A      SA077X.   COGFRQDFF_A       SA076X.
         COGAMTDFF_A       SA075X. 
 
         /* UPP  FORMAT ASSOCIATIONS */
         UPPSLFCR_A        SA089X.   UPPRAISE_A        SA089X.   UPPOBJCT_A        SA089X.
         DISAB3_A          SA065X. 
 
         /* SOC  FORMAT ASSOCIATIONS */
         SOCERRNDS_A       SA089X.   SOCSCLPAR_A       SA089X.   SOCWRKLIM_A       SA147X. 
 
         /* ADO  FORMAT ASSOCIATIONS */
         DEVDONSET_A       SA147X. 
 
         /* INS  FORMAT ASSOCIATIONS */
         NOTCOV_A          SA041X.   COVER_A           SA010X.   COVER65_A         SA011X.
         SINCOVDE_A        SA147X.   SINCOVVS_A        SA147X.   SINCOVRX_A        SA147X.
         MEDICARE_A        SA029X.   MCPART_A          SA113X.   MCCHOICE_A        SA147X.
         MCHMO_A           SA147X.   MCADVR_A          SA037X.   MCPARTD_A         SA147X.
         MEDICAID_A        SA029X.   MAXCHNG_A         SA147X.   MAPREM_A          SA147X.
         MADEDUC_A         SA147X.   MAHDHP_A          SA051X.   MAFLG_A           SA035X.
         PRIVATE_A         SA029X.   EXCHANGE_A        SA020X.   POLHLD1_A         SA147X.
         PRPLCOV1_A        SA147X.   PRPOLH1_A         SA126X.   PRPLCOV1_C_A      SA147X.
         PLNWRKR1_A        SA048X.   PLNEXCHG1_A       SA147X.   PLN1PAY1_A        SA114X.
         PLN1PAY2_A        SA114X.   PLN1PAY3_A        SA114X.   PLN1PAY4_A        SA114X.
         PLN1PAY5_A        SA114X.   PLN1PAY6_A        SA114X.   HICOSTR1_A        SA025X.
         PRDEDUC1_A        SA147X.   PRHDHP1_A         SA124X.   HSAHRA1_A         SA147X.
         PRRXCOV1_A        SA147X.   PRDNCOV1_A        SA147X.   PRVSCOV1_A        SA147X.
         EXCHPR1_A         SA021X.   PRFLG_A           SA050X.   PXCHNG1_A         SA147X.
         PRPREM1_A         SA147X.   PLEXCHPR1_A       SA021X.   POLHLD2_A         SA147X.
         PRPLCOV2_A        SA147X.   PRPOLH2_A         SA126X.   PRPLCOV2_C_A      SA147X.
         PLNWRKR2_A        SA048X.   PLNEXCHG2_A       SA147X.   PLN2PAY1_A        SA114X.
         PLN2PAY2_A        SA114X.   PLN2PAY3_A        SA114X.   PLN2PAY4_A        SA114X.
         PLN2PAY5_A        SA114X.   PLN2PAY6_A        SA114X.   HICOSTR2_A        SA025X.
         PRDEDUC2_A        SA147X.   PRHDHP2_A         SA124X.   HSAHRA2_A         SA147X.
         PRRXCOV2_A        SA147X.   PRDNCOV2_A        SA147X.   PRVSCOV2_A        SA147X.
         EXCHPR2_A         SA021X.   CHIP_A            SA029X.   CHXCHNG_A         SA147X.
         CHPREM_A          SA147X.   CHDEDUC_A         SA147X.   CHHDHP_A          SA051X.
         CHFLG_A           SA008X.   OTHPUB_A          SA029X.   OPXCHNG_A         SA147X.
         OPPREM_A          SA147X.   OPDEDUC_A         SA147X.   OPHDHP_A          SA051X.
         PLEXCHOP_A        SA021X.   OPFLG_A           SA043X.   OTHGOV_A          SA029X.
         OGXCHNG_A         SA147X.   OGPREM_A          SA147X.   OGDEDUC_A         SA147X.
         OGHDHP_A          SA051X.   PLEXCHOG_A        SA021X.   OGFLG_A           SA042X.
         MILITARY_A        SA029X.   MILSPC1R_A        SA114X.   MILSPC2_A         SA114X.
         MILSPC3_A         SA114X.   IHS_A             SA147X.   HILAST_A          SA142X.
         HILASTMY_A        SA116X.   HISTOPJOB_A       SA147X.   HISTOPMISS_A      SA147X.
         HISTOPAGE_A       SA147X.   HISTOPCOST_A      SA147X.   HISTOPELIG_A      SA147X.
         RSNHICOST_A       SA147X.   RSNHIWANT_A       SA147X.   RSNHIELIG_A       SA147X.
         RSNHICONF_A       SA147X.   RSNHIMEET_A       SA147X.   RSNHIWAIT_A       SA147X.
         RSNHIOTH_A        SA147X.   RSNHIJOB_A        SA147X.   RSNHIMISS_A       SA147X.
         HINOTYR_A         SA147X.   HINOTMYR_A        SA116X.   MILSPC1_A         SA114X.
         HICOV_A           SA147X.   HIKIND01_A        SA114X.   HIKIND02_A        SA114X.
         HIKIND03_A        SA114X.   HIKIND04_A        SA114X.   HIKIND05_A        SA114X.
         HIKIND06_A        SA114X.   HIKIND07_A        SA114X.   HIKIND08_A        SA114X.
         HIKIND09_A        SA114X.   HIKIND10_A        SA114X.   MCAREPRB_A        SA147X.
         MCAIDPRB_A        SA147X. 
 
         /* PAY  FORMAT ASSOCIATIONS */
         PAYBLL12M_A       SA147X.   PAYNOBLLNW_A      SA147X.   PAYWORRY_A        SA072X. 
 
         /* CVD  FORMAT ASSOCIATIONS */
         CVDDIAG_A         SA147X.   COVIDTEST_A       SA147X.   CVDRSLT_A         SA080X.
         CVDSEV_A          SA081X. 
 
         /* TSC  FORMAT ASSOCIATIONS */
         CVDSYMSM_A        SA147X.   CVDSMREC_A        SA099X.   CVDSYMTST_A       SA147X.
         CVDTSTREC_A       SA099X. 
 
         /* UTZ  FORMAT ASSOCIATIONS */
         LASTDR_A          SA142X.   WELLNESS_A        SA147X.   WELLVIS_A         SA142X.
         USUALPL_A         SA145X.   USPLKIND_A        SA123X.   URGNT12MTC_A      SA062X.
         EMERG12MTC_A      SA018X.   HOSPONGT_A        SA147X.   MEDDL12M_A        SA147X.
         MEDNG12M_A        SA147X. 
 
         /* ACC  FORMAT ASSOCIATIONS */
         DLYCARE_A         SA147X.   DNGCARE_A         SA147X.   VIRAPP12M_A       SA147X.
         VIRAPPCVD_A       SA147X. 
 
         /* CNV  FORMAT ASSOCIATIONS */
         CANCOVTREA_A      SA147X.   CANCOVCHG_A       SA147X.   CANCOVOTH_A       SA147X.
         CANCOVCARE_A      SA147X. 
 
         /* PMD  FORMAT ASSOCIATIONS */
         RX12M_A           SA147X.   RXSK12M_A         SA147X.   RXLS12M_A         SA147X.
         RXDL12M_A         SA147X.   RXDG12M_A         SA147X. 
 
         /* PRV  FORMAT ASSOCIATIONS */
         BPLAST_A          SA142X.   CHOLLAST_A        SA142X.   DIBLAST1_A        SA142X.
         DIBA1CLAST_A      SA142X.   DIBA1CNMT_A       SA014X.   COLORECTEV_A      SA147X.
         COLORECTYP_A      SA078X.   COLWHEN_A         SA141X.   COLREASON_A       SA079X.
         COLPAY_A          SA127X.   COLSIGWHEN_A      SA141X.   SIGWHEN_A         SA141X.
         CTCOLEV1_A        SA147X.   FITHEV1_A         SA147X.   FITHWHEN1_A       SA141X.
         COLOGUARD1_A      SA147X.   FITCOLG1_A        SA147X.   CGUARDWHE1_A      SA141X.
         COLPROB1_A        SA147X.   COLTEST1_A        SA114X.   COLTEST2_A        SA114X.
         COLTEST3_A        SA114X.   COLTEST4_A        SA114X.   COLTEST5_A        SA114X.
         COLTEST6_A        SA114X.   PSATEST_A         SA147X.   PSAWHEN_A         SA141X.
         PSAREASON_A       SA097X.   PSASUGGEST_A      SA128X.   CERVICEV1_A       SA147X.
         CERVICWHEN_A      SA141X.   CERREASON1_A      SA079X.   PAPTEST_A         SA147X.
         HPVTEST_A         SA147X.   TELLCERVIC_A      SA147X.   CERVICRES_A       SA147X.
         CERVICNOT1_A      SA121X.   HYSTEV1_A         SA147X.   MAMEV_A           SA147X.
         MAMWHEN_A         SA141X.   MAMPAY_A          SA127X.   MAMREASON_A       SA097X.
         MAMAGE1ST1_A      SA150X.   MAMNOT1_A         SA111X. 
 
         /* IMS  FORMAT ASSOCIATIONS */
         PREGFLUYR_A       SA147X.   LIVEBIRTH_A       SA147X.   SHTFLU12M_A       SA147X.
         SHTFLUM_A         SA115X.   SHTFLUY_A         SA064X.   FLUPREG_A         SA148X.
         FLUPREG2_A        SA149X.   SHTCVD19_A        SA147X.   SHTCVD19NM_A      SA082X.
         CVDVAC1MR_A       SA115X.   CVDVAC1YR_A       SA064X.   CVDVAC2MR_A       SA115X.
         CVDVAC2YR_A       SA064X.   SHTCVD19AV_A      SA147X.   SHTPNUEV_A        SA147X.
         SHTPNEUNB_A       SA129X.   SHTSHINGLE_A      SA147X.   ZOSTAVAX1_A       SA147X.
         ZOSTAVXYRP_A      SA069X.   ZOSTAWHEN_A       SA147X.   SHINGRIX1_A       SA147X.
         SHINGRIXNB_A      SA136X.   SHINGRXYRP_A      SA058X.   SHINGWHEN_A       SA147X.
         TDAPPREG_A        SA147X.   SHTHEPB_A         SA147X.   SHTHEPA_A         SA147X.
         LIVEHEP_A         SA147X.   WORKHEALTH_A      SA147X.   WRKHLTHFC_A       SA147X.
         TRAVEL_A          SA147X. 
 
         /* CGR  FORMAT ASSOCIATIONS */
         HOMEHC12M_A       SA147X.   HOMECAREDG_A      SA147X.   FAMCARE12M_A      SA147X.
         FAMCAREDNG_A      SA147X.   FAMCARECVD_A      SA147X. 
 
         /* ANX  FORMAT ASSOCIATIONS */
         ANXFREQ_A         SA103X.   ANXMED_A          SA147X.   ANXLEVEL_A        SA109X. 
 
         /* DEP  FORMAT ASSOCIATIONS */
         DEPFREQ_A         SA103X.   DEPMED_A          SA147X.   DEPLEVEL_A        SA109X. 
 
         /* MHC  FORMAT ASSOCIATIONS */
         MHRX_A            SA147X.   MHTHRPY_A         SA147X.   MHTPYNOW_A        SA147X.
         MHTHDLY_A         SA147X.   MHTHND_A          SA147X. 
 
         /* SPD  FORMAT ASSOCIATIONS */
         SAD_A             SA071X.   NERVOUS_A         SA071X.   RESTLESS_A        SA071X.
         HOPELESS_A        SA071X.   EFFORT_A          SA071X.   WORTHLESS_A       SA071X.
         K6SPD_A           SA032X. 
 
         /* PAI  FORMAT ASSOCIATIONS */
         PAIFRQ3M_A        SA102X.   PAIAMNT_A         SA109X.   PAIWKLM3M_A       SA102X.
         PAIAFFM3M_A       SA102X.   PAIBACK3M_A       SA117X.   PAIULMB3M_A       SA117X.
         PAILLMB3M_A       SA117X.   PAIHDFC3M_A       SA117X.   PAIAPG3M_A        SA117X.
         PAITOOTH3M_A      SA117X. 
 
         /* REP  FORMAT ASSOCIATIONS */
         REPSTRAIN_A       SA147X.   REPLIMIT_A        SA147X.   REPSAWDOC_A       SA147X.
         REPWRKDYTC_A      SA013X.   REPFUTWRK_A       SA147X.   REPSTOPCHG_A      SA147X.
         REPREDUCE_A       SA147X.   REPWRKCAUS_A      SA147X. 
 
         /* INJ  FORMAT ASSOCIATIONS */
         ANYINJURY_A       SA147X.   INJLIMIT_A        SA147X.   NUMINJTC_A        SA001X.
         INJHOME_A         SA147X.   INJWORK_A         SA147X.   INJSPORTS_A       SA147X.
         INJFALL_A         SA147X.   INJFALLHOM_A      SA147X.   INJFALLWRK_A      SA147X.
         INJMOTOR_A        SA147X.   INJMVTYPE1_A      SA114X.   INJMVTYPE2_A      SA114X.
         INJMVTYPE3_A      SA114X.   INJMVTYPE4_A      SA114X.   INJMVTYPE5_A      SA114X.
         INJCHORES_A       SA147X.   INJSAWDOC_A       SA147X.   INJER_A           SA147X.
         INJHOSP_A         SA147X.   INJBONES_A        SA147X.   INJSTITCH_A       SA147X.
         INJWRKDYTC_A      SA013X.   INJFUTWRK_A       SA147X.   INJSTOPCHG_A      SA147X.
         INJREDUCE_A       SA147X. 
 
         /* TSM  FORMAT ASSOCIATIONS */
         SMELLDF_A         SA090X.   SMELLCOMP_A       SA073X.   SMELLPHT_A        SA147X.
         TASTEDF_A         SA091X.   TASTECOMP_A       SA073X.   TASTEFLAV_A       SA073X.
         TASTEUNW_A        SA147X.   TSTSMHP_A         SA147X.   TSTSMLAST_A       SA141X. 
 
         /* CIG  FORMAT ASSOCIATIONS */
         SMKEV_A           SA147X.   SMKNOW_A          SA098X.   SMKCIGST_A        SA059X.
         CIGNOW_A          SA086X.   SMK30D_A          SA083X.   CIG30D_A          SA086X.
         ECIGEV_A          SA147X.   ECIGNOW_A         SA098X.   SMKECIGST_A       SA016X. 
 
         /* OTB  FORMAT ASSOCIATIONS */
         CIGAREV_A         SA147X.   CIGARCUR_A        SA098X.   CIGAR30D_A        SA083X.
         PIPEEV_A          SA147X.   PIPECUR_A         SA098X.   SMOKELSEV_A       SA147X.
         SMOKELSCUR_A      SA098X. 
 
         /* SOS  FORMAT ASSOCIATIONS */
         SUPPORT_A         SA140X.   CMPSUPPORT_A      SA074X. 
 
         /* ORN  FORMAT ASSOCIATIONS */
         ORIENT_A          SA119X. 
 
         /* MAR  FORMAT ASSOCIATIONS */
         MARITAL_A         SA112X.   SPOUSLIV_A        SA147X.   SPOUSEP_A         SA147X.
         EVRMARRIED_A      SA147X.   MARSTAT_A         SA036X.   LEGMSTAT_A        SA034X.
         SPOUSESEX_A       SA135X.   SASPPRACE_A       SA066X.   SASPPHISP_A       SA066X.
         SPOUSAGETC_A      SA004X.   SPOUSEDUCP_A      SA017X.   SPOUSWRK_A        SA147X.
         SPOUSWKFT_A       SA147X.   PRTNRSEX_A        SA135X.   PRTNRAGETC_A      SA004X.
         PRTNREDUCP_A      SA017X.   PRTNRWRK_A        SA147X.   PRTNRWKFT_A       SA147X.
         SAPARENTSC_A      SA056X.   PARSTAT_A         SA044X. 
 
         /* VET  FORMAT ASSOCIATIONS */
         AFVET_A           SA147X.   AFVETTRN_A        SA147X.   COMBAT_A          SA147X.
         VADISB_A          SA147X.   VAHOSP_A          SA147X.   VACAREEV_A        SA147X. 
 
         /* NAT  FORMAT ASSOCIATIONS */
         NATUSBORN_A       SA147X.   YRSINUS_A         SA068X.   CITZNSTP_A        SA009X. 
 
         /* SCH  FORMAT ASSOCIATIONS */
         SCHCURENR_A       SA147X.   SCHDYMSSTC_A      SA057X. 
 
         /* EMP  FORMAT ASSOCIATIONS */
         EMPWRKLSW1_A      SA147X.   EMPWHYNOT_A       SA095X.   EMPLSTWOR1_A      SA094X.
         EMPWKHRS3_A       SA019X.   EMPWRKFT1_A       SA147X.   EMPSICKLV_A       SA147X.
         EMPHEALINS_A      SA147X.   EMPDYSMSS3_A      SA012X. 
 
         /* EMD  FORMAT ASSOCIATIONS */
         EMDSUPER_A        SA147X.   EMDWRKCAT1_A      SA093X. 
 
         /* JOB  FORMAT ASSOCIATIONS */
         JOBTAX_A          SA147X.   JOBCHGEARN_A      SA105X.   JOBSHIFT_A        SA108X.
         JOBCHGSCH_A       SA106X.   JOBVARYSCH_A      SA147X.   JOBADVSCH_A       SA104X.
         JOBLKYLOSS_A      SA107X.   JOBWRKSICK_A      SA084X.   JOBMISS_A         SA084X. 
 
         /* SDW  FORMAT ASSOCIATIONS */
         CURJOBSD1_A       SA147X.   WRKCLSSD1_A       SA137X.   WRKCLSNSD1_A      SA146X.
         WRKCLSOFT1_A      SA137X.   SDMSRS1_A         SA147X.   SDMSRSOFT1_A      SA134X.
         RECJOBSD1_A       SA147X.   JOBANYSD1_A       SA147X.   RJCLSSD1_A        SA137X.
         CLSWRKSD1_A       SA134X.   RJCLSNOSD1_A      SA130X.   RJCLSOFT1_A       SA137X.
         CLSWRKNOS1_A      SA060X. 
 
         /* FEM  FORMAT ASSOCIATIONS */
         PCNTADTWKP_A      SA045X.   PCNTADTWFP_A      SA045X. 
 
         /* INC  FORMAT ASSOCIATIONS */
         INCWRKO_A         SA147X.   INCINTER_A        SA147X.   INCSSRR_A         SA147X.
         INCSSISSDI_A      SA147X.   SSISSDIBTH_A      SA138X.   SSISSDIDSB_A      SA147X.
         INCWELF_A         SA147X.   INCRETIRE_A       SA147X.   INCOTHR_A         SA147X.
         POVRATTC_A        SA049X.   RATCAT_A          SA053X.   IMPINCFLG_A       $SA028X. 
 
         /* FOO  FORMAT ASSOCIATIONS */
         FSNAP12M_A        SA147X.   FSNAP30D_A        SA147X.   FWIC12M_A         SA147X.
         FLUNCH12M_A       SA147X. 
 
         /* FDS  FORMAT ASSOCIATIONS */
         FDSRUNOUT_A       SA144X.   FDSLAST_A         SA144X.   FDSBALANCE_A      SA144X.
         FDSSKIP_A         SA147X.   FDSSKIPDYS_A      SA085X.   FDSLESS_A         SA147X.
         FDSHUNGRY_A       SA147X.   FDSWEIGHT_A       SA147X.   FDSNOTEAT_A       SA147X.
         FDSNEDAYS_A       SA085X.   FDSCAT3_A         SA022X.   FDSCAT4_A         SA023X. 
 
         /* HOU  FORMAT ASSOCIATIONS */
         HOUYRSLIV_A       SA143X.   HOUTENURE_A       SA101X.   HOUGVASST_A       SA147X. 
    ;
run;
 
/* You can edit after this line before the generate proc contents program. */
/*-------------------------------------------------------------------------*/
 
/* generate contents and some frequencies */
proc contents DATA=NHIS.&adultds;
    TITLE1 'Contents of the 2021 NHIS Sample Adult file';
run;
 
proc freq data=NHIS.&adultds notitle;
    tables intv_qrt/list missing;
    title1 'Frequency report for Sample Adult file';
    title2 '(weighted)';
    weight WTFA_A;
run;
 
proc freq data=NHIS.&adultds notitle;
    tables rectype/list missing;
    title1 'Frequency report for NHIS Sample Adult file';
    title2 '(unweighted)';
run;
