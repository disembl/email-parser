email-parser
============

A small email parser in Ruby, completed for a 30 minute coding challenge.

To use, simply run:

    ruby parser.rb filename flag

filename is just a file of raw email data

flag options are:

`-t` <- prints the recipient (to)<br />
`-f` <- prints the sender (from)<br />
`-d` <- prints the date (date)<br />
`-b` <- prints the message body (body)<br />
`-s` <- prints the message subject (subject)<br />
`-a` <- prints everything (all)<br />
