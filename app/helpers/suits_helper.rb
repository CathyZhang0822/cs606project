module SuitsHelper

    
    def action
        action_name == 'advance_search' ? :post : :get
    end
    
    def display_suit_sorted_column_headers(search)
        string = content_tag(:th, sort_link(search, :appid, "Suit ID", method: action))
        string << content_tag(:th, sort_link(search, :gender, "Gender", method: action))
        string << content_tag(:th, sort_link(search, :size, "Size", method: action))
        string << content_tag(:th, sort_link(search, :user_name_cont, "Renter", method: action))
        string << content_tag(:th, "Status")
        string << content_tag(:th, "Actions")

    end
    
    def display_suit_sorted_search_results(objects)
        objects.each_with_object('') do |object, string|
            string << content_tag(:tr, display_suit_sorted_search_results_row(object))
        end
    end
    
    def display_suit_sorted_search_results_row(object)
        string = content_tag(:td, link_to(object.appid, '/suits/' + object.id.to_s))
        string << content_tag(:td, object.gender)
        string << content_tag(:td, object.size)
        if object.user 
            string << content_tag(:td, User.find(object.user_id).username)
            string << content_tag(:td, "In Borrow")
        else
            string << content_tag(:td, "")
            string << content_tag(:td, "Available")
        end
        string << content_tag(:td, link_to('Edit', edit_suit_path(object)) +'|'+
                              link_to('Delete', object, method: :delete, data: { confirm: 'Are you sure?' } ))
        
    end
end