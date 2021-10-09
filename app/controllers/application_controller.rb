class ApplicationController < ActionController::API
    
  # Add private methods to handle page and page limit 
  private

    def page
      ####################################################################
      #           Doc string for private page method
      ####################################################################
      #   page function is to handle page from request.
      # 
      #   Default Value:
      #     page will be 1
      ####################################################################

      @page ||= params[:page] || 1
    end

    def per_page
      ####################################################################
      #           Doc string for private per_page method
      ####################################################################
      #   per_page function is to handle no of records in response.
      # 
      #   Default Value:
      #     per_page limit will be 5
      ####################################################################

      @per_page ||= params[:per_page] || 5
    end

end
