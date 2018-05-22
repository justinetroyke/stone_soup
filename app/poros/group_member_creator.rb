class GroupMemberCreator
  def initialize(group_id:, member_id:)
    GroupMember.create!(member_id: member_id, group_id: group_id)
  end
end
