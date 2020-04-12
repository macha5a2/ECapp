class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    # @itemにproduct_imagesの情報を入れることのできるインスタンスを生成
    @item.product_images.build
  end
  
  def create
    @item = Item.new(item_params)
    respond_to do |format|
      # バリデーションチェックが通ればフォーム記載内容をデータベースに保存する
      # また、バリデーションチェックした際のエラーメッセージをjson形式にてnew_item.jsへ返す
      if @item.valid? 
        @item.save
        format.html { redirect_to root_path }
        format.json { render json: @item.errors.messages }
      else
        format.json { render json: @item.errors.messages }
      end
    end
  end

  def verification
  end

  def verification_address
  end

  def credit
  end
  
  def show
    @item = Item.find(params[:id])
    @images = @item.product_images
    @image = @images.first #保存した画像の1番目を表示するためのインスタンス変数
  end

  def edit
  end

  def destroy
  end
  
  private
  def item_params
    params.require(:item).permit(
      :product_name,
      :product_information,
      :product_status,
      :price,
      :product_condition,
      :shipping_charge,
      :prefecture_id,
      :days_of_ship, 
      :brand,
      :size,
      # :category_id,
      # attributesを用いてparamsの中にproduct_imagesの情報が入ることを許可
      product_images_attributes: [:id, 
                                 :image,
                                 :item_id],)
      # .merge(seller_id: current_user.id)
  end

end
