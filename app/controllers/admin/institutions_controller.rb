module Admin
  class InstitutionsController < Admin::ApplicationController
    def import_receivers
      service = ImportReceiversFromCSV.new(path: params["file"].tempfile, institution_id: params[:id])
      service.perform

      flash[:notice] = "Imported #{service.imported_receivers} receivers with #{service.failed_receivers} failures!"

      redirect_to admin_institution_path(institution)
    end
  end
end
