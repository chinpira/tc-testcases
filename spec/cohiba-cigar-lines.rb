require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "CohibaCigarLines" do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "http://www.thompsoncigar.com/"
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
    @driver.get(@base_url)
    if element_present?(:css, "a.ui-dialog-titlebar-close")
      @driver.find_element(:css, "a.ui-dialog-titlebar-close").click
    end
  end
  
  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end
  
  it "test_cohiba_cigar_lines" do
    @driver.get(@base_url + "/category/CIGAR-BRANDS/COHIBA/9909/pc/9833.uts")
    @driver.find_element(:link, "Cohiba Red Dot").click
    verify { (@driver.title).should == "Cohiba Red Dot Cigars - Thompson Cigar" }
    verify { (@driver.current_url).should == "http://www.thompsoncigar.com/thumbnail/CIGAR-BRANDS/COHIBA/COHIBA/8523/c/9909/pc/9833.uts" }
    verify { element_present?(:css, "div.ThumbnailProductVerticalColumn").should be_true }
    @driver.get(@base_url + "/category/CIGAR-BRANDS/COHIBA/9909/pc/9833.uts")
    @driver.find_element(:link, "Cohiba Black").click
    verify { (@driver.title).should == "Cohiba Black Cigars - Thompson Cigar" }
    verify { (@driver.current_url).should == "http://www.thompsoncigar.com/thumbnail/CIGAR-BRANDS/COHIBA/COHIBA-BLACK/8524/c/9909/pc/9833.uts" }
    verify { element_present?(:css, "div.ThumbnailProductVerticalColumn").should be_true }
    @driver.get(@base_url + "/category/CIGAR-BRANDS/COHIBA/9909/pc/9833.uts")
    @driver.find_element(:link, "Cohiba XV").click
    verify { (@driver.title).should == "Cohiba XV Cigars - Thompson Cigar" }
    verify { (@driver.current_url).should == "http://www.thompsoncigar.com/thumbnail/CIGAR-BRANDS/COHIBA/COHIBA-XV/8525/c/9909/pc/9833.uts" }
    verify { element_present?(:css, "div.ThumbnailProductVerticalColumn").should be_true }
    @driver.get(@base_url + "/category/CIGAR-BRANDS/COHIBA/9909/pc/9833.uts")
  end
  
  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end
end
