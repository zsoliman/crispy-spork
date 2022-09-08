class VendorsController < ApplicationController

    def index
        vendor = Vendor.all
        render json: vendor, only: [:id, :name]
    end

    def show
        vendor = Vendor.find_by(id: params[:id])
        if vendor
            render json: vendor, only: [:id, :name], include: :vendor_sweets, status: 200
        else
            render json: {error: "Vendor not found"}, status: 404
        end
    end

end
