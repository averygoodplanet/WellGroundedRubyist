# notes from Ch.11 on Regular Expressions (e.g. regexp)
# regular expressions are a special notation for describing
# patterns in strings

# literal constructor
/ /.class => Regexp

# string or regexp can be on either side of the comparison

# =~ pattern-matching operator returns either nil (no match) or index
# of first character where first match occurs
irb(main):003:0> /zebra/ =~ 'hidingzebrahiding'
6
irb(main):008:0> /zebra/ =~ 'nothing'
nil
irb(main):010:0> 'nothing' =~ /zebra/
nil
irb(main):011:0> 'hidingzebrahiding' =~ /zebra/
6

# there are both String#match and Regexp#match, which seems to act the same
# from a practical standpoint;
# they return either nil (no match) or a MatchData object
irb(main):004:0> /zebra/.match('hidingzebrahiding')
#<MatchData "zebra">
irb(main):005:0> /zebra/.match('nothing')
nil
irb(main):006:0> 'hidingzebrahiding'.match(/zebra/)
#<MatchData "zebra">
irb(main):007:0> 'nothing'.match(/zebra/)
nil

# special characters
# ^$?./\[]{}()+*
# need to be escaped by a preceding backslash if you want them to be treated
# as themselves (as a character and not as a special character)

# see rubular.com for reference and trying out Ruby regex patterns for matches

# dot (.) as matching any character
'azebra'.match(/.zebra/)
#<MatchData "azebra">

# character class is a set of characters in square-brackets
# although it can have many possible characters inside it, it only selects
# for one character in a match.

# if I want zebra followed by any one digitt
irb(main):017:0> '1zebra'.match(/[0-9]zebra/)
#<MatchData "1zebra">
# \d is escape sequence equivalent to [0-9]
irb(main):018:0> '1zebra'.match(/\dzebra/)
#<MatchData "1zebra">
# \D means 'NOT \d', e.g. any character that is not [0-9]
irb(main):019:0> '1zebra'.match(/\Dzebra/)
nil
irb(main):020:0> 'azebra'.match(/\Dzebra/)
#<MatchData "azebra">

# the caret (^) inside character class means 'NOT'
irb(main):023:0> 'azebra'.match(/[^0-9]zebra/)
#<MatchData "azebra">

#\w number, alpha, underscore
irb(main):024:0> '_zebra'.match(/\wzebra/)
#<MatchData "_zebra">
#\W means NOT \w
#\s is whitespace, \S is NOT \s
irb(main):025:0> ' zebra'.match(/\szebra/)
#<MatchData " zebra">

# + means one or more,  ? means zero or one,  \. is escaped dot (period instead of 
# the wildcard special character . )
irb(main):032:0> 'Doe,John,Mr.,a man of the people'.match(/[A-Za-z]+,[A-Za-z]+,Mrs?\.,[A-Za-z ]+/)
#<MatchData "Doe,John,Mr.,a man of the people">

# get the full match using matchdata.string
irb(main):033:0> 'Doe,John,Mr.,a man of the people'.match(/[A-Za-z]+,[A-Za-z]+,Mrs?\.,[A-Za-z ]+/).string
=> "Doe,John,Mr.,a man of the people"

# use parentheses within regex to get groups from within the regex match
irb(main):035:0> 'Doe,John,Mr.,a man of the people'.match(/([A-Za-z]+),[A-Za-z]+,(Mrs?\.),[A-Za-z ]+/)
#<MatchData "Doe,John,Mr.,a man of the people" 1:"Doe" 2:"Mr.">
irb(main):036:0> $1
"Doe"
irb(main):037:0> $2
"Mr."
# Ruby stores matching substrings in global variables from left to right, $1, $2, etc.

# listing 11.1 Matching a phone number and querying the resulting MatchData object
string = 'My phone number is (123) 555-1234'
# escapes the parentheses,  the squigly brackets \d{3} is specifiying the number of
# characters to match
irb(main):073:0> phone_regex = /\((\d{3})\)\s+(\d{3})-(\d{4})//\((\d{3})\)\s+(\d{3})-(\d{4})/
irb(main):074:0> match_object = string.match(phone_regex)
#<MatchData "(123) 555-1234" 1:"123" 2:"555" 3:"1234">
full_string = match_object.string
"My phone number is (123) 555-1234"
irb(main):079:0> match_object[0]
"(123) 555-1234"
irb(main):080:0> match_object[1]
"123"
irb(main):081:0> match_object[2]
"555"
irb(main):082:0> match_object[3]
"1234"
irb(main):083:0> match_object.captures
[
    [0] "123", # 0th in .captures is the first capture instead of the original string
    [1] "555",
    [2] "1234"
]
# the order of captures matches left-to-right, starting with outer-to-inner
irb(main):088:0> /((a)((b)c))/.match("abc")
#<MatchData "abc" 1:"abc" 2:"a" 3:"bc" 4:"b">
irb(main):103:0> match_object = /body/.match("the entire body should move together")
#<MatchData "body">
irb(main):104:0> match_object.pre_match
"the entire "
irb(main):105:0> match_object.post_match
" should move together"
# the index within the whole where the 0th match begins 
irb(main):107:0> match_object.begin(0)
11
irb(main):110:0> "the entire body should move together"[11,4]
"body"
irb(main):113:0> match_object.pre_match + match_object[0] + match_object.post_match
"the entire body should move together"
irb(main):127:0> "the entire body should move together"[match_object.begin(0),match_object.end(0) - match_object.begin(0)]
"body"

# zero-or-one is question mark (?)
irb(main):001:0> "1".match(/\d/)
#<MatchData "1">
irb(main):002:0> "11".match(/\d/)
#<MatchData "1">
irb(main):003:0> "11".match(/\d\d?/)
#<MatchData "11">
irb(main):004:0> "1".match(/\d\d?/)
#<MatchData "1">

# the zero-or-more operator is asterisk *  (greedy, match as many as can)
# example shows that is useful for possible whitespace
irb(main):006:0> "< /example>".match(/\s*example/)
#<MatchData "example">
irb(main):007:0> "< /example   >".match(/\s*example>/)
nil
irb(main):008:0> "< /example>".match(/\s*example>/)
#<MatchData "example>">
irb(main):009:0> "< /example>".match(/\s*example\s*>/)
#<MatchData "example>">
irb(main):010:0> "</example    >".match(/\s*example\s*>/)
#<MatchData "example    >">

# the one-or-more operator is +  (greedy, match as many as can)
irb(main):011:0> "Looking for a number 123 here".match(/\d+/)
#<MatchData "123">
irb(main):012:0> "Looking for a number here".match(/\d+/)
nil
irb(main):013:0> "Looking for a number 123 here".match(/(\d+)/)
#<MatchData "123" 1:"123">
irb(main):014:0> $1
"123"

# making + non-greedy by following it with (?)
irb(main):015:0> "abc!def!ghi!".match(/.+!/)
#<MatchData "abc!def!ghi!">
irb(main):016:0> "abc!def!ghi!".match(/.+?!/)
#<MatchData "abc!">

# regex engine limits its greediness to trying to get a match
irb(main):019:0> "limit greed 12345".match(/\d+5/)
#<MatchData "12345">
irb(main):020:0> "limit greed 12345".match(/(\d+)5/)
#<MatchData "12345" 1:"1234">
irb(main):021:0> "limit greed 12345".match(/(\d+)(5)/)
#<MatchData "12345" 1:"1234" 2:"5">

# specific number, using {}
irb(main):022:0> "123-45-6789".match(/(\d{4})/)
#<MatchData "6789" 1:"6789">
# range using {a, b}
irb(main):031:0> "three or more digits, 1234".match(/(\d{3,})/)
#<MatchData "1234" 1:"1234">
irb(main):032:0> "three or more digits, 12".match(/(\d{3,})/)
nil

irb(main):034:0> "between one and two digits, 12".match(/(\d{1,2})/)
#<MatchData "12" 1:"12">
irb(main):035:0> "between one and two digits, 1".match(/(\d{1,2})/)
#<MatchData "1" 1:"1">
irb(main):036:0> "between one and two digits, 123".match(/(\d{1,2})/)
#<MatchData "12" 1:"12">

# anchor to beginning of line using caret (^)
# anchors determine whether a match at all
irb(main):048:0> "starts with start".match(/^starts.*/)
#<MatchData "starts with start">
irb(main):049:0> "doesn't starts with start".match(/^starts.*/)
nil
irb(main):050:0> "doesn't starts with start".match(/starts.*/)
#<MatchData "starts with start">

# see rubular re other anchors

# positive lookahead with (?=foo)
irb(main):051:0> "123 456. 789".match(/\d+/)
#<MatchData "123">
irb(main):052:0> "123 456. 789".match(/\d+\./)
#<MatchData "456.">
# positive lookahead checks that it is present but doesn't add it to the match
irb(main):053:0> "123 456. 789".match(/\d+(?=\.)/)
#<MatchData "456">

# negative lookahead with (?!foo)
irb(main):055:0> "123Z 456Z 789A".match(/\d+(?!Z)/)
#<MatchData "12">
irb(main):056:0> "123Z 456Z 789A".match(/\d{3}(?!Z)/)
#<MatchData "789">

#positive lookbehind with (?<=foo)
irb(main):057:0> "let us prosper".match(/prosper/)
#<MatchData "prosper">
irb(main):058:0> "let us prosper".match(/(?<=and )prosper/)
nil
irb(main):059:0> "let us live long and prosper".match(/(?<=and )prosper/)
#<MatchData "prosper">

# negative lookbehind with (?<!foo)
irb(main):060:0> "a hot dog is not a labrador".match(/(?<!hot )dog/)
nil
irb(main):061:0> "a labrador dog is not real dog".match(/(?<!hot )dog/)
#<MatchData "dog">

# match but don't capture with (?:foo)
irb(main):066:0> "aaa bbb ccc".match(/(aaa) .* (ccc)/)
#<MatchData "aaa bbb ccc" 1:"aaa" 2:"ccc">
irb(main):067:0> "aaa bbb ccc".match(/(aaa) (?:bbb) (ccc)/)
#<MatchData "aaa bbb ccc" 1:"aaa" 2:"ccc">
irb(main):068:0> "aaa ddd ccc".match(/(aaa) (?:bbb) (ccc)/)
nil
