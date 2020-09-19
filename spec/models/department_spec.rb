require "rails_helper"

RSpec.describe Department, type: :model do
  subject { department }

  let!(:department) { build(:department) }

  describe "department_name validations" do
    context "when 'department_name' is empty" do
      before { department.department_name = "" }

      it { is_expected.to be_invalid }
    end

    context "when 'department_name' is not empty" do
      it { is_expected.to be_valid }
    end

    context "when 'department_name' is 31 characters" do
      before { department.department_name = "a" * 31 }

      it { is_expected.to be_invalid }
    end

    context "when 'department_name' is 30 characters" do
      before { department.department_name = "a" * 30 }

      it { is_expected.to be_valid }
    end
  end

  describe "manager_name validations" do
    context "when 'manager_name' is empty" do
      before { department.manager_name = "" }

      it { is_expected.to be_invalid }
    end

    context "when 'manager_name' is not empty" do
      it { is_expected.to be_valid }
    end

    context "when 'manager_name' is 61 characters" do
      before { department.manager_name = "a" * 61 }

      it { is_expected.to be_invalid }
    end

    context "when 'manager_name' is 60 characters" do
      before { department.manager_name = "a" * 60 }

      it { is_expected.to be_valid }
    end
  end

  describe "description validations" do
    context "when 'description' is 256 characters" do
      before { department.description = "a" * 256 }

      it { is_expected.to be_invalid }
    end

    context "when 'description' is 255 characters" do
      before { department.description = "a" * 255 }

      it { is_expected.to be_valid }
    end
  end
end
