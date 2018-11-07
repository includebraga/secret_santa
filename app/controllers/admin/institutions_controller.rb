module Admin
  class InstitutionsController < Admin::ApplicationController
    def import_receivers
      service = ImportReceiversFromCSV.new(csv_params)
      service.perform

      flash[:notice] = "Imported #{service.imported_receivers} receivers with #{service.failed_receivers} failures!"

      redirect_to admin_institution_path(params[:institution_id])
    end

    private

    def csv_params
      { path: params["file"].tempfile, institution_id: params[:institution_id] }
    end
  end
end
