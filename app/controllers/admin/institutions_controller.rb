module Admin
  class InstitutionsController < Admin::ApplicationController
    def import_receivers
      institution = Institution.find(params[:id])
      csv_file = params["file"].tempfile
      csv_content = File.read(csv_file)
      service = ImportReceiversFromCsv.new(csv_content, institution)

      service.perform

      flash[:notice] = "Imported #{service.imported_receivers} receivers with #{service.failed_receivers} failures!"

      redirect_to admin_institution_path(institution)
    end
  end
end
