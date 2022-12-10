module Types
  class UserRoleEnum < BaseEnum
    User.role.each_value do |user_role|
      value user_role.to_s.upcase, user_role.text, value: user_role.to_s
    end
  end
end
