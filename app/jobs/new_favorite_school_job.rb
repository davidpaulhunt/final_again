class NewFavoriteSchoolJob
  include SuckerPunch::Job

  def perform(group, player)
    build_notifications(group, player)
    # AssignmentMailer.notify_cohort_new_assignment(group, assignment)
  end

  def build_notifications(group, player)
    group.each do |user|
      note = user.notifications.build
      note.notifieable_id = player.id
      note.notifieable_type = "FavoriteSchool"
      note.save!
    end
  end

end