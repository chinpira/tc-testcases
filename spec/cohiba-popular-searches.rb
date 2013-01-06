require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "CohibaPopularSearches" do

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
  
  it "test_cohiba_popular_searches" do
    @driver.get(@base_url + "/category/CIGAR-BRANDS/COHIBA/9909/pc/9833.uts")
    @driver.find_element(:link, "Cohiba Mini Cigars").click
    verify { (@driver.title).should == "COHIBA MINI CIGARILLO CAMEROON - Thompson Cigar" }
    verify { element_present?(:css, "div.ButtonPrimaryMediumText").should be_true }
    @driver.get(@base_url + "/category/CIGAR-BRANDS/COHIBA/9909/pc/9833.uts")
    @driver.find_element(:link, "Cohiba Cigar Review").click
    verify { (@driver.title).should == "Cohiba Cigar Reviews & Ratings - Thompson Cigar" }
    verify { element_present?(:css, "#ProductGrid_THUMBNAIL_ITEMS > div.ThumbnailProductVerticalColumn").should be_true }
    @driver.get(@base_url + "/category/CIGAR-BRANDS/COHIBA/9909/pc/9833.uts")
    @driver.find_element(:link, "Cohiba Pequenos").click
    verify { (@driver.title).should == "Cohiba Pequenos Cigarillos - Thompson Cigar" }
    verify { element_present?(:css, "#ProductGrid_THUMBNAIL_ITEMS > div.ThumbnailProductVerticalColumn").should be_true }
    @driver.get(@base_url + "/category/CIGAR-BRANDS/COHIBA/9909/pc/9833.uts")
    @driver.find_element(:link, "Cohiba Cigars Torpedo").click
    verify { (@driver.title).should == "COHIBA TRIANGULO CAMEROON PYRAMID - Thompson Cigar" }
    verify { element_present?(:css, "div.ButtonPrimaryMediumText").should be_true }
    @driver.get(@base_url + "/category/CIGAR-BRANDS/COHIBA/9909/pc/9833.uts")
    @driver.find_element(:link, "Cohiba Churchill").click
    verify { (@driver.title).should == "Cohiba Churchill Cigars - Thompson Cigar" }
    verify { element_present?(:css, "#ProductGrid_THUMBNAIL_ITEMS > div.ThumbnailProductVerticalColumn").should be_true }
    @driver.get(@base_url + "/category/CIGAR-BRANDS/COHIBA/9909/pc/9833.uts")
    @driver.find_element(:link, "Cohiba Robusto").click
    verify { (@driver.title).should == "Cohiba Robusto Cigars - Thompson Cigar" }
    verify { element_present?(:css, "#ProductGrid_THUMBNAIL_ITEMS > div.ThumbnailProductVerticalColumn").should be_true }
    @driver.get(@base_url + "/category/CIGAR-BRANDS/COHIBA/9909/pc/9833.uts")
    @driver.find_element(:link, "Cohiba Red Dot").click
    verify { (@driver.title).should == "Cohiba Red Dot Cigars - Thompson Cigar" }
    verify { element_present?(:css, "#ProductGrid_THUMBNAIL_ITEMS > div.ThumbnailProductVerticalColumn").should be_true }
    @driver.get(@base_url + "/category/CIGAR-BRANDS/COHIBA/9909/pc/9833.uts")
    @driver.find_element(:link, "Cohiba Black").click
    verify { (@driver.title).should == "Cohiba Black Cigars - Thompson Cigar" }
    verify { element_present?(:css, "#ProductGrid_THUMBNAIL_ITEMS > div.ThumbnailProductVerticalColumn").should be_true }
    @driver.get(@base_url + "/category/CIGAR-BRANDS/COHIBA/9909/pc/9833.uts")
    @driver.find_element(:link, "Cohiba XV").click
    verify { (@driver.title).should == "Cohiba XV Cigars - Thompson Cigar" }
    verify { element_present?(:css, "#ProductGrid_THUMBNAIL_ITEMS > div.ThumbnailProductVerticalColumn").should be_true }
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
