module Administrate::ApplicationHelper
  PLURAL_MANY_COUNT = 2.1

  def application_title
    if Rails::VERSION::MAJOR <= 5
      Rails.application.class.parent_name.titlecase
    else
      Rails.application.class.module_parent_name.titlecase
    end
  end

  def render_field(field, locals = {})
    locals[:field] = field
    render locals: locals, partial: field.to_partial_path
  end

  def requireness(field)
    required_field?(field) ? "required" : "optional"
  end

  def required_field?(field)
    has_presence_validator?(field.resource.class, field.attribute)
  end

  def has_presence_validator?(resource_class, field_name)
    validators_on(resource_class, field_name).
      any? { |v| v.class == ActiveRecord::Validations::PresenceValidator }
  end

  def validators_on(resource_class, field_name)
    return [] unless resource_class.respond_to?(:validators_on)

    resource_class.validators_on(field_name)
  end

  def dashboard_from_resource(resource_name)
    "#{resource_name.to_s.singularize}_dashboard".classify.constantize
  end

  def model_from_resource(resource_name)
    dashboard = dashboard_from_resource(resource_name)
    dashboard.try(:model) || resource_name.to_sym
  end

  def display_resource_name(resource_name)
    dashboard_from_resource(resource_name).resource_name(
      count: PLURAL_MANY_COUNT,
      default: default_resource_name(resource_name),
    )
  end

  def sort_order(order)
    case order
    when "asc" then "ascending"
    when "desc" then "descending"
    else "none"
    end
  end

  def resource_index_route(resource_name)
    url_for(
      action: "index",
      controller: "/#{namespace}/#{resource_name}",
    )
  end

  def sanitized_order_params(page, current_field_name)
    collection_names = page.item_includes + [current_field_name]
    association_params = collection_names.map do |assoc_name|
      { assoc_name => %i[order direction page per_page] }
    end
    params.permit(:search, :id, :_page, :per_page, association_params)
  end

  def clear_search_params
    params.except(:search, :_page).permit(
      :per_page, resource_name => %i[order direction]
    )
  end

  # 新規作成ボタンのテキスト変更
  def convert_new_button_text(page)
    case page.resource_name
    when "user"
      "#{User.model_name.human}新規作成"
    when "department"
      "#{Department.model_name.human}新規作成"
    when "book"
      "#{Book.model_name.human}新規作成"
    else
      "undefind"
    end
  end

  # h1タグのテキスト変更
  def convert_header_text(page)
    case page.resource_name
    when "user"
      page.resource.full_name
    when "department"
      page.resource.department_name
    when "book"
      page.resource.title
    else
      "undefind"
    end
  end

  # fieldが'admin'だった場合、'管理者/一般'と表示
  def convert_attribute_admin(field)
    field.to_s == "true" ? "管理者" : "一般"
  end

  # fieldがbelongs_toだった場合の表示変更
  def convert_attribute_belongs_to(field)
    if field.data.class == Department
      field.data.department_name
    end
  end

  # fieldがhas_manyだった場合の表示変更
  def convert_attribute_has_many(field)
    if field.associated_class == User
      "#{field.data.size}人"
    end
  end

  private

  def default_resource_name(resource_name)
    resource_name.to_s.pluralize.gsub("/", "_").titleize
  end
end
