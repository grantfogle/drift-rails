# filters
# [high water, low water, frozen, hot water]
# 

class StreamsService
    def initialize(filters = {})
        @filters = filters
    end

    def call
        fetch_streams
    end

    def search_streams(query)
        return Stream.limit(10) if query.blank?
        
        Stream.where("stream_name LIKE :query OR 
                      watershed LIKE :query OR 
                      state LIKE :query", 
                      query: "%#{query}%")
              .limit(10)
    end

    def fetch_favorited_streams
        Current.user.favorited_streams
    end

    private

    def fetch_streams
        Stream.limit(10)
    end
end