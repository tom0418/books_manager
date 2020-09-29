module Admin::UsersHelper
  # 管理者権限の表示変更
  def convert_attribute_boolean_admin(field)
    field.to_s == "true" ? "管理者" : "一般"
  end

  # 所属部署の表示変更
  def convert_attribute_belongs_to_department(field)
    if action_name == "index" || action_name == "show"
      field.data.department_name
    else
      field.associated_resource_options.map do |arr|
        unless arr.nil?
          arr[0] = Department.find_by(id: arr[1]).department_name
          [arr[0], arr[1]]
        end
      end
    end
  end
end
