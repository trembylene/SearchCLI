def search_json_data(search_term, all_data)
    @matched_results = []

    all_data.each do |object|
        object.values.find_all { |value|
            if (value == search_term.to_i)
                @matched_results << object
            elsif (value == search_term)
                @matched_results << object
            elsif (value.is_a?(Array))
                value.each do |array_item|
                    if (array_item == search_term || array_item == search_term.to_i)
                        @matched_results << object
                    end
                end
            end
        }
    end

    @matched_results
end