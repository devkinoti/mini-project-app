class TeamMemberTaskManager
  def team_member_task_manager(team_members)
    available_team_member_collection = []
    team_members.each do |team_member|
      if team_member.tasks.count < 5
        available_team_member_collection << team_member
      end
    end
    available_team_member_collection
  end
end