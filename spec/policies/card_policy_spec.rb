require 'rails_helper'

describe CardPolicy do
  subject { CardPolicy.new(user, list) }

  let(:list) { create(:list, created_by: user) }
  let(:card) { create(:card, list: list, created_by: user) }

  context "valid member" do
    let!(:user) { create(:member) }

    it { should permit(:index)}
    it { should permit(:create)}
    it { should permit(:update)}
    it { should permit(:destroy)}
  end

  context "invalid member" do
    let!(:user) { create(:member) }
    let!(:invalid_user) { create(:member) }
    let(:list) { create(:list, created_by: invalid_user) }

    it { should_not permit(:index)}
    it { should_not permit(:create)}
    it { should_not permit(:update)}
    it { should_not permit(:destroy)}
  end

  context "valid admin" do
    let!(:user) { create(:admin) }

    it { should permit(:index)}
    it { should permit(:create)}
    it { should permit(:update)}
    it { should permit(:destroy)}
  end



end