# enable all rules
all
# use atx headings (#, rather than underlining)
rule 'MD003', :style => :atx
# use dashes for unordered lists
rule 'MD004', :style => :dash
# ensure nested lists are indented by 4 spaces
# pandoc requires 4 spaces for nesting
rule 'MD007', :indent => 4
# set max line length to 80
rule 'MD013', :line_length => 80
# allow headers to end with ? or ! but not other punctuation
rule 'MD026', :punctuation => ".,;:"
# force sensible no of spaces depending on list type
rule 'MD030', :ul_multi => 3, :ol_multi => 2
# force a consistent horiz-rule marker
rule 'MD035', :style => "---"
