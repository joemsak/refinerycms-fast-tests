# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Planets" do
    describe "Admin" do
      describe "planets" do
        login_refinery_user

        describe "planets list" do
          before(:each) do
            FactoryGirl.create(:planet, :name => "UniqueTitleOne")
            FactoryGirl.create(:planet, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.planets_admin_planets_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.planets_admin_planets_path

            click_link "Add New Planet"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Planets::Planet.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Planets::Planet.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:planet, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.planets_admin_planets_path

              click_link "Add New Planet"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Planets::Planet.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:planet, :name => "A name") }

          it "should succeed" do
            visit refinery.planets_admin_planets_path

            within ".actions" do
              click_link "Edit this planet"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:planet, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.planets_admin_planets_path

            click_link "Remove this planet forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Planets::Planet.count.should == 0
          end
        end

      end
    end
  end
end
