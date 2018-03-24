require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

    def setup
        @category = Category.new(name: "sports")
    end

    test "category should be valid" do
        assert @category.valid?
    end

    test "name should be present" do
        @category.name = " "
        assert_not @category.valid?
    end

    test "name should be unique" do
        @category.save
        category2 = Category.new(name: "sports")
        assert_not category2.valid?
    end

    test "name should not be to long" do
        @category.name = "a" * 26 #Kategori får inte vara längre än 25 tecken.
        assert_not @category.valid?
    end

    test "name should not be to short" do
        @category.name = "aa" #Får inte vara kortare än 3 tecken.
        assert_not @category.valid?
    end

end