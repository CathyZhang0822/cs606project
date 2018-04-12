module RentalsHelper
        
    def action
        action_name == 'advance_search' ? :post : :get
    end
    
    def display_rental_sorted_column_headers(search)
           string = content_tag(:th, sort_link(search, :pickUpTime , "Pick Up Time", method: action))
           string << content_tag(:th, sort_link(search, :expectedReturnTime , "Expected Return Time", method: action))
           string << content_tag(:th, sort_link(search, :returnTime , "Return Time", method: action))
           string << content_tag(:th, sort_link(search, :status , "Status", method: action))
           string << content_tag(:th, sort_link(search, :user_UIN_cont , "Customer UIN", method: action))
           string << content_tag(:th, sort_link(search, :suit_appid_cont, "Suit App. ID", method: action))
    end
    
    def display_rental_sorted_search_results(objects)
        objects.each_with_object('') do |object, string|
            string << content_tag(:tr, display_rental_sorted_search_results_row(object))
        end
    end
    
    def display_rental_sorted_search_results_row(object)
            string = content_tag(:td, link_to(object.pickUpTime, '/rentals/' + object.id.to_s))
            string << content_tag(:td, object.expectedReturnTime)
            string << content_tag(:td, object.returnTime)
            string << content_tag(:td, object.status)
            string << content_tag(:td, User.find(object.user_id).UIN)
            string << content_tag(:td, Suit.find(object.suit_id).appid)
    end
end