class Api::CarouselsController < Api::ApplicationController

  def index
    optional! :page, default: 1
    optional! :per, default: 20, values: 1..100
    record = Carousel.all.ransack(q_params).result
    @records = Kaminari.paginate_array(record).page(1).per(20)
  end



  private

    def set_carousel
      @record = Carousel.find(params[:id])
    end

    def q_params
      if params[:q]
        params.require(:q).permit(:image_eq, :name_eq, :is_hot_eq)
      end
    end

    def carousel_params
      params.permit(:image, :name, :is_hot)
    end
end
