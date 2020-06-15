class CartItemsController < ApplicationController
  before_action :authenticate_customer!, :except => [ :index ]
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]

  # GET /cart_items
  # GET /cart_items.json
  def index
     total_price = 0
     #@cart_items = CartItem.all
     @customer = Customer.find(current_customer.id)

    @cart_items = @customer.cart_items
    @cart_items.each do |cart_item|
      total_price += cart_item.product.price
    end
    puts"-----"
    puts total_price
  end

  # GET /cart_items/1
  # GET /cart_items/1.json
  def show
    @cart_item = CartItem.find(params[:id])


  end

  # GET /cart_items/new
  def new
    @cart_item = CartItem.new
  end

  # GET /cart_items/1/edit
  def edit
    @cart_item = CartItem.find(params[:id])

    @product=Product.find(@cart_item.product_id)

  end


  # POST /cart_items
  # POST /cart_items.json
  def create
    # if product already exists in present cart of the current user assign it to result
     result = CartItem.where("quantity>=1 AND customer_id=? AND product_id=?" ,current_customer.id, params[:cart_item][:product_id])
    if result.length > 0
      @cart_item = result[0]
      @cart_item.quantity+= cart_item_params[:quantity].to_i
      #@cart_item = result[0].update(cart_item_params)
      #@cart_item = CartItem.find(params[:cart_item][:id])
    #if CartItem.where("quantity>=1 AND customer_id=? AND product_id=?" ,current_customer.id, params[:cart_item][:product_id])
      #cart_item = CartItem.find_by( [ "customer_id = #{current_customer.id} AND product_id = #{params[:cart_item][:product_id]}" ])
        #cart_item.update(cart_item.id, :quantity => cart_item.quantity + 1)


   else
      #@cart_item = CartItem.create!( :product => @product, :quantity => 1)

      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer = current_customer
      puts"----"
      puts current_customer.inspect

    end
    respond_to do |format|
     @customer = Customer.find(current_customer.id)

    @cart_items = @customer.cart_items
      if @cart_item.save
        format.html { redirect_to @cart_item, notice: 'Cart item was successfully created.' }
        format.json { render :show, status: :created, location: @cart_item }
      else
        format.html { render :new }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cart_items/1
  # PATCH/PUT /cart_items/1.json
  def update
    respond_to do |format|
      if @cart_item.update(cart_item_params)
        format.html { redirect_to @cart_item, notice: 'Cart item was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart_item }
      else
        format.html { render :edit }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cart_items/1
  # DELETE /cart_items/1.json
  def destroy
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_items_url, notice: 'Cart item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_item_params
      params.require(:cart_item).permit(:quantity, :product_id)
    end
end