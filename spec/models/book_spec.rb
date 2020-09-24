require "rails_helper"

RSpec.describe Book, type: :model do
  subject { book }

  let!(:book) { build(:book) }

  describe "'title' validations" do
    context "when 'title' is empty" do
      before { book.title = "" }

      it { is_expected.to be_invalid }
    end

    context "when 'title' is not empty" do
      before { book.title = "not empty" }

      it { is_expected.to be_valid }
    end

    context "when it already exists" do
      before do
        book_with_same_title = book.dup
        book_with_same_title.save
      end

      it { is_expected.to be_invalid }
    end
  end

  describe "'author' validations" do
    context "when 'author' is empty" do
      before { book.author = "" }

      it { is_expected.to be_invalid }
    end

    context "when 'author' is not empty" do
      before { book.author = "not empty" }

      it { is_expected.to be_valid }
    end
  end

  describe "'published_date' validations" do
    context "when 'published_date' is empty" do
      before { book.published_date = "" }

      it { is_expected.to be_invalid }
    end

    context "when 'published_date' is not empty" do
      before { book.published_date = "not empty" }

      it { is_expected.to be_valid }
    end

    context "when 'published_date' is 11 characters" do
      before { book.published_date = "2020-01-010" }

      it { is_expected.to be_invalid }
    end

    context "when 'published_date' is 10 characters" do
      before { book.published_date = "2020-01-01" }

      it { is_expected.to be_valid }
    end
  end

  describe "'isbn_10' validations" do
    context "when 'isbn_10' is not numericality" do
      before { book.isbn_10 = "string" }

      it { is_expected.to be_invalid }
    end

    context "when 'isbn_10' is numericality" do
      before { book.isbn_10 = 111 }

      it { is_expected.to be_valid }
    end

    context "when 'isbn_10' is 11 digits" do
      before { book.isbn_10 = 40_000_000_011 }

      it { is_expected.to be_invalid }
    end

    context "when 'isbn_10' is 10 digits" do
      before { book.isbn_10 = 4_000_000_001 }

      it { is_expected.to be_valid }
    end

    context "when it already exists" do
      before do
        book_with_same_isbn10 = book.dup
        book_with_same_isbn10.save
      end

      it { is_expected.to be_invalid }
    end
  end

  describe "'isbn_13' validations" do
    context "when 'isbn_13' is not numericality" do
      before { book.isbn_13 = "string" }

      it { is_expected.to be_invalid }
    end

    context "when 'isbn_13' is numericality" do
      before { book.isbn_13 = 111 }

      it { is_expected.to be_valid }
    end

    context "when 'isbn_13' is 14 digits" do
      before { book.isbn_13 = 90_000_000_000_011 }

      it { is_expected.to be_invalid }
    end

    context "when 'isbn_13' is 13 digits" do
      before { book.isbn_13 = 9_000_000_000_001 }

      it { is_expected.to be_valid }
    end

    context "when it already exists" do
      before do
        book_with_same_isbn13 = book.dup
        book_with_same_isbn13.save
      end

      it { is_expected.to be_invalid }
    end
  end

  describe "'quantity' validations" do
    context "when 'quantity' is null" do
      before { book.quantity = nil }

      it { is_expected.to be_invalid }
    end

    context "when 'quantity' is not null" do
      before { book.quantity = 1 }

      it { is_expected.to be_valid }
    end

    context "when 'quantity' is not numericality" do
      before { book.quantity = "string" }

      it { is_expected.to be_invalid }
    end

    context "when 'quantity' is numericality" do
      before { book.quantity = 10 }

      it { is_expected.to be_valid }
    end
  end
end
