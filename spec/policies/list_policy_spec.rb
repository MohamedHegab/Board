require 'rails_helper'

describe ListPolicy do
  subject { ListPolicy.new(user, list) }

  let(:list) { create(:list, created_by: user) }

  context "for a valid member" do
    let(:user) { create(:member) }

    it { should permit(:index)}
    it { should_not permit(:create)}
    it { should_not permit(:update)}
    it { should_not permit(:destroy)}
    it { should_not permit(:assign_member)}
    it { should_not permit(:unassign_member)}
  end

  context "for a invalid member" do
    let(:user) { create(:member) }
    let(:invalid_user) { create(:member) }
    let(:list) { create(:list, created_by: invalid_user) }

    it { should_not permit(:index)}
    it { should_not permit(:create)}
    it { should_not permit(:update)}
    it { should_not permit(:destroy)}
    it { should_not permit(:assign_member)}
    it { should_not permit(:unassign_member)}
  end

  context "for a valid admin" do
    let(:user) { create(:admin) }

    it { should permit(:index)}
    it { should permit(:create)}
    it { should permit(:update)}
    it { should permit(:destroy)}
    it { should permit(:assign_member)}
    it { should permit(:unassign_member)}
  end

  context "for a invalid admin" do
    let(:user) { create(:admin) }
    let(:invalid_user) { create(:admin) }
    let(:list) { create(:list, created_by: invalid_user) }

    it { should_not permit(:index)}
    it { should permit(:create)}
    it { should_not permit(:update)}
    it { should_not permit(:destroy)}
    it { should_not permit(:assign_member)}
    it { should_not permit(:unassign_member)}
  end

end