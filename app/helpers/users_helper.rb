module UsersHelper
    
    def user_fields
        [:username, :UIN, :email, :phone]
    end
    
    def action
        action_name == 'advance_search' ? :post : :get
    end
    
    def display_user_sorted_column_headers(search)
       user_fields.each_with_object('') do |field, string|
           string << content_tag(:th, sort_link(search, field, {}, method: action))
       end
    end
    
    def display_user_sorted_search_results(objects)
        objects.each_with_object('') do |object, string|
            string << content_tag(:tr, display_user_sorted_search_results_row(object))
        end
    end
    
    def display_user_sorted_search_results_row(object)
        fieldCount = 0
        user_fields.each_with_object('') do |field, string|
            if fieldCount == 0
                string << content_tag(:td, link_to(object.send(field), '/users/' + object.id.to_s))
            else
                string << content_tag(:td, object.send(field))
            end
            
            fieldCount += 1
        end
        .html_safe
    end
end