require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "CohibaCigarReviews" do

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
  
  it "test_cohiba_cigar_reviews" do
    @driver.get(@base_url + "/category/CIGAR-BRANDS/COHIBA/9909/pc/9833.uts")
    @driver.find_element(:link, "Cohiba Pequenos Cameroon Cigarillo").click
    verify { element_present?(:css, "div.ButtonPrimaryMediumText").should be_true }
    @driver.get(@base_url + "/category/CIGAR-BRANDS/COHIBA/9909/pc/9833.uts")
    @driver.find_element(:link, "Cohiba XV 645 Sumatra Lonsdale Cigars").click
    verify { element_present?(:css, "div.ButtonPrimaryMediumText").should be_true }
    @driver.get(@base_url + "/category/CIGAR-BRANDS/COHIBA/9909/pc/9833.uts")
    @driver.find_element(:link, "Cohiba Black Tubes Robusto Cigars").click
    verify { element_present?(:css, "div.ButtonPrimaryMediumText").should be_true }
    @driver.get(@base_url + "/category/CIGAR-BRANDS/COHIBA/9909/pc/9833.uts")
    @driver.find_element(:link, "Cohiba Plus Case Cameroon Lonsdale Grande").click
    verify { element_present?(:css, "div.ButtonPrimaryMediumText").should be_true }
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
