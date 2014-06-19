class NewFavoriteSchoolJob
  include SuckerPunch::Job

  def perform(school, player)
    build_notifications(school, player)
    # AssignmentMailer.notify_cohort_new_assignment(group, assignment)
  end

  def build_notifications(school, player)
    note = school.account.notifications.build
    note.notifieable_id = player.id
    note.notifieable_type = "FavoriteSchool"
    note.save!
  end

end