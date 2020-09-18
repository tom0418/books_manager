require "rails_helper"

RSpec.describe User, type: :model do
  subject { user }

  let!(:department) { create(:department) }
  let!(:user) { build(:user, department_id: department.id) }

  describe "email validation" do
    context "when 'email' is empty" do
      before { user.email = "" }

      it { is_expected.to be_invalid }
    end

    context "when 'email' is not empty" do
      it { is_expected.to be_valid }
    end

    context "when email is 255 characters" do
      before { user.email = "a" * 243 + "@example.com" }

      it { is_expected.to be_invalid }
    end

    context "when email is 254 characters" do
      before { user.email = "a" * 242 + "@example.com" }

      it { is_expected.to be_valid }
    end

    context "when email is in invalid format" do
      invalid_emails = %w[
        user@foo,com
        user_at_foo.org
        it.user@foo.foo@bar.com
        foo@bar+baz.com
        foo@bar..com
      ]

      it "is invalid" do
        invalid_emails.each do |invalid_email|
          user.email = invalid_email
          expect(user).to be_invalid
        end
      end
    end

    context "when email is in valid format" do
      valid_emails = %w[
        user@foo.COM
        A_US-ER@f.b.org
        frst.lst@foo.jp
        a+b@baz.cn
      ]

      it "is valid" do
        valid_emails.each do |valid_email|
          user.email = valid_email
          expect(user).to be_valid
        end
      end
    end

    context "when it already exists" do
      before do
        user_with_same_email = user.dup
        user_with_same_email.email = user.email.upcase
        user_with_same_email.skip_confirmation_notification!
        user_with_same_email.skip_confirmation!
        user_with_same_email.save
      end

      it { is_expected.to be_invalid }
    end
  end

  describe "first_name validation" do
    context "when 'first_name' is empty" do
      before { user.first_name = "" }

      it { is_expected.to be_invalid }
    end

    context "when 'first_name' is not empty" do
      it { is_expected.to be_valid }
    end

    context "when first_name is 31 characters" do
      before { user.first_name = "あ" * 31 }

      it { is_expected.to be_invalid }
    end

    context "when first_name is 30 characters" do
      before { user.first_name = "あ" * 30 }

      it { is_expected.to be_valid }
    end
  end

  describe "last_name validation" do
    context "when 'last_name' is empty" do
      before { user.last_name = "" }

      it { is_expected.to be_invalid }
    end

    context "when 'last_name' is not empty" do
      it { is_expected.to be_valid }
    end

    context "when last_name is 31 characters" do
      before { user.last_name = "あ" * 31 }

      it { is_expected.to be_invalid }
    end

    context "when last_name is 30 characters" do
      before { user.last_name = "あ" * 30 }

      it { is_expected.to be_valid }
    end
  end
end
