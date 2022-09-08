class VendorSweetsController < ApplicationController

    def create
        vs = VendorSweet.create(vs_params)
        if vs.valid?
            render json: {id: vs.id, name: vs.sweet.name, price: vs.price}, status: 201
            
            
        else
            render json: {errors: vs.errors.full_messages}, status: 422
        end
    end 

    def destroy
        vs = VendorSweet.find_by(id: params[:id])
        if vs
            vs.destroy
            render json: {}
        else
            render json: {error: "VendorSweet not found"}, status: 404
        end
    end


    private

    def vs_params
        params.permit(:price, :vendor_id, :sweet_id)
    end
end
