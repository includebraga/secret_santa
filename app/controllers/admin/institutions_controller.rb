module Admin
  class InstitutionsController < Admin::ApplicationController
    def import_receivers
      service = ImportReceiversFromCsv.new(path: params["file"].tempfile, institution_id: params[:institution_id])
      service.perform

      flash[:notice] = "Imported #{service.imported_receivers} receivers with #{service.failed_receivers} failures!"

      redirect_to admin_institution_path(params[:institution_id])
    end
  end
end
