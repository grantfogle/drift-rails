class StreamsService
    def initialize(filters = {})
        @filters = filters
    end

    def call
        fetch_streams
    end

    private

    def fetch_streams
        Stream.limit(20)
    end

end