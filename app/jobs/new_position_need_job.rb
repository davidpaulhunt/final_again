class NewPositionNeedJob
  include SuckerPunch::Job

  def perform(group, school)
    build_notifications(group, school)
    # AssignmentMailer.notify_cohort_new_assignment(group, assignment)
  end

  def build_notifications(group, school)
    group.each do |user|
      note = user.notifications.build
      note.notifieable_id = school.id
      note.notifieable_type = "PositionNeed"
      note.save!
    end
  end

end