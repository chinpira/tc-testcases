# require "spec/ruby"
# require "spec/runner"

# output T/F as Green/Red
ENV['RSPEC_COLOR'] = 'true'

require File.join(File.dirname(__FILE__),  "cohiba-popular-searches")
require File.join(File.dirname(__FILE__),  "cohiba-category-links")
require File.join(File.dirname(__FILE__),  "cohiba-cigar-lines")
require File.join(File.dirname(__FILE__),  "cohiba-cigar-reviews")
require File.join(File.dirname(__FILE__),  "cohiba-feature-offer")
