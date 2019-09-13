require 'spec_helper'

describe Spree::Shipping::Box do
  context "database fields" do
    it { expect(subject).to have_db_column(:id).of_type(:integer) }
    it { expect(subject).to have_db_column(:description).of_type(:string).with_options(null: false) }
    it { expect(subject).to have_db_column(:length).of_type(:integer).with_options(default: 0, null: false) }
    it { expect(subject).to have_db_column(:width).of_type(:integer).with_options(default: 0, null: false) }
    it { expect(subject).to have_db_column(:height).of_type(:integer).with_options(default: 0, null: false) }
  end

  context "database indexes" do
    it { expect(subject).to have_db_index(:description).unique(true) }
  end

  context "configuration" do
    context "validations" do
      it { expect(subject).to validate_uniqueness_of(:description).case_insensitive }
    end

    describe "associations" do
      it { expect(subject).to have_many(:packages) }
    end
  end
end
