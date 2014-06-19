module FormHelper

  def build_account_for_user(user)
    if user.account.empty?
      user.account.build
    end
    user
  end
end