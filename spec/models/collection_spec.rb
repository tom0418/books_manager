require "rails_helper"

RSpec.describe Collection, type: :model do
  subject { collection }

  let!(:book) { create(:book) }
  let!(:collection) { build(:collection, collection_code: "#{book.id}-1") }

  describe "'collection_code' validations" do
    context "when 'collection_code is empty" do
      before { collection.collection_code = "" }

      it { is_expected.to be_invalid }
    end

    context "when 'collection_code is not empty" do
      it { is_expected.to be_valid }
    end
  end
end
