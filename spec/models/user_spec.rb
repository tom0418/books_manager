require "rails_helper"

RSpec.describe User, type: :model do
  subject { user }

  let!(:user) { build(:user) }

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

  # describe "password validation" do
  #   context "when 'password' is empty" do
  #     before { user.password = "" }

  #     it { is_expected.to be_invalid }
  #   end

  #   context "when 'password' is not empty" do
  #     it { is_expected.to be_valid }
  #   end

  #   context "when password is in invalid format" do
  #     invalid_passwords = %w[
  #       7Abcdef
  #       13Abcdefghijk
  #       aaaaaaaa
  #       8aaaaaaa
  #       8AAAAAAA
  #     ]

  #     it "is invalid" do
  #       invalid_passwords.each do |invalid_password|
  #         user.password = invalid_password
  #         expect(user).to be_invalid
  #       end
  #     end
  #   end

  #   context "when password is in valid format" do
  #     valid_passwords = %w[
  #       8Abcdefg
  #       12Abcdefghij
  #     ]

  #     it "is valid" do
  #       valid_passwords.each do |valid_password|
  #         user.password = valid_password
  #         expect(user).to be_valid
  #       end
  #     end
  #   end
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

    context "when first_name is in invalid format" do
      invalid_first_names = %w[
        １１１１１１
        user
        あああ！！
        テスト\ ユーザー
      ]

      it "is invalid" do
        invalid_first_names.each do |invalid_first_name|
          user.first_name = invalid_first_name
          expect(user).to be_invalid
        end
      end
    end

    context "when first_name is in valid format" do
      valid_first_names = %w[
        ユーザー
        利用者
        り用シャ
      ]

      it "is valid" do
        valid_first_names.each do |valid_first_name|
          user.first_name = valid_first_name
          expect(user).to be_valid
        end
      end
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

    context "when last_name is in invalid format" do
      invalid_last_names = %w[
        １１１１１１
        user
        あああ！！
        テスト\ ユーザー
      ]

      it "is invalid" do
        invalid_last_names.each do |invalid_last_name|
          user.last_name = invalid_last_name
          expect(user).to be_invalid
        end
      end
    end

    context "when last_name is in valid format" do
      valid_last_names = %w[
        ユーザー
        利用者
        り用シャ
      ]

      it "is valid" do
        valid_last_names.each do |valid_last_name|
          user.last_name = valid_last_name
          expect(user).to be_valid
        end
      end
    end
  end
end
