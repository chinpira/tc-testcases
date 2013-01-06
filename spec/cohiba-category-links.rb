require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "CohibaCategoryLinks" do

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
  
  it "test_cohiba_category_links" do
    puts "Beginning test"
    @driver.get(@base_url + "/category/CIGAR-BRANDS/COHIBA/9909/pc/9833.uts")
    verify { element_present?(:link, "BEST SELLING COHIBA CIGARS").should be_true }
    @driver.find_element(:link, "BEST SELLING COHIBA CIGARS").click
    verify { (@driver.title).should == "Best Selling Cohiba Cigars - Thompson Cigar" }
    verify { element_present?(:css, "#ProductGrid_THUMBNAIL_ITEMS > div.ThumbnailProductVerticalColumn").should be_true }
    @driver.get(@base_url + "/category/CIGAR-BRANDS/COHIBA/9909/pc/9833.uts")
    verify { element_present?(:link, "COHIBA").should be_true }
    @driver.find_element(:link, "COHIBA").click
    verify { (@driver.title).should == "Cohiba Red Dot Cigars - Thompson Cigar" }
    verify { element_present?(:css, "#ProductGrid_THUMBNAIL_ITEMS > div.ThumbnailProductVerticalColumn").should be_true }
    @driver.get(@base_url + "/category/CIGAR-BRANDS/COHIBA/9909/pc/9833.uts")
    verify { element_present?(:link, "COHIBA BLACK").should be_true }
    @driver.find_element(:link, "COHIBA BLACK").click
    verify { (@driver.title).should == "Cohiba Black Cigars - Thompson Cigar" }
    verify { element_present?(:css, "#ProductGrid_THUMBNAIL_ITEMS > div.ThumbnailProductVerticalColumn").should be_true }
    @driver.get(@base_url + "/category/CIGAR-BRANDS/COHIBA/9909/pc/9833.uts")
    verify { element_present?(:link, "COHIBA EXTRA VIGOROSO").should be_true }
    @driver.find_element(:link, "COHIBA EXTRA VIGOROSO").click
    verify { (@driver.title).should == "Cohiba XV Cigars - Thompson Cigar" }
    verify { element_present?(:css, "#ProductGrid_THUMBNAIL_ITEMS > div.ThumbnailProductVerticalColumn").should be_true }
    @driver.get(@base_url + "/category/CIGAR-BRANDS/COHIBA/9909/pc/9833.uts")
    verify { (@driver.find_elements(:xpath, "//div[contains(@class, 'catTypeWrapper')]").size).should == 4 }
    if @verification_errors.count > 0 
      puts "Everything not okay..."
    else
      puts "Everything a-okay..."
    end
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
