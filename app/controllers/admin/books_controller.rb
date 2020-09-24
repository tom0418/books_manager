module Admin
  class BooksController < Admin::ApplicationController
    # Overwrite any of the RESTful controller actions to implement custom behavior
    # For example, you may want to send an email after a foo is updated.
    #
    # def update
    #   super
    #   send_foo_updated_email(requested_resource)
    # end

    # Override this method to specify custom lookup behavior.
    # This will be used to set the resource for the `show`, `edit`, and `update`
    # actions.
    #
    # def find_resource(param)
    #   Foo.find_by!(slug: param)
    # end

    # The result of this lookup will be available as `requested_resource`

    # Override this if you have certain roles that require a subset
    # this will be used to set the records shown on the `index` action.
    #
    # def scoped_resource
    #   if current_user.super_admin?
    #     resource_class
    #   else
    #     resource_class.with_less_stuff
    #   end
    # end

    # Override `resource_params` if you want to transform the submitted
    # data before it's persisted. For example, the following would turn all
    # empty values into nil values. It uses other APIs such as `resource_class`
    # and `dashboard`:
    #
    # def resource_params
    #   params.require(resource_class.model_name.param_key).
    #     permit(dashboard.permitted_attributes).
    #     transform_values { |value| value == "" ? nil : value }
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information

    def create
      resource = resource_class.new(resource_params)
      authorize_resource(resource)

      if resource.save
        create_collection(resource)
        redirect_to(
          [namespace, resource],
          notice: translate_with_resource("create.success")
        )
      else
        render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, resource)
        }
      end
    end

    def search
      google_book_data = GoogleBook.search(params[:keyword])
      resource = resource_class.new
      resource = resource.substitute_for_googlebook(google_book_data)
      authorize_resource(resource)

      render :new, locals: {
        page: Administrate::Page::Form.new(dashboard, resource)
      }
    end

    private

    def create_collection(resource)
      quantities = resource.quantity

      quantities.times do |quantity|
        collection_code = "#{resource.id}-#{quantity + 1}"
        resource.collections.create(collection_code: collection_code)
      end
    end
  end
end
