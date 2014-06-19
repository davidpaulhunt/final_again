class NewPositionNeedJob
  include SuckerPunch::Job

  def perform(players, school)
    build_notifications(players, school)
    # AssignmentMailer.notify_cohort_new_assignment(group, assignment)
  end

  def build_notifications(players, school)
    players.each do |player|
      note = player.account.notifications.build
      note.notifieable_id = school.id
      note.notifieable_type = "PositionNeed"
      note.save!
    end
  end

end