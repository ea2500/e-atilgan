class DocumentsController < ApplicationController
  before_action :bounce_non_logged_in_user, only: [:index]
  before_action :bounce_non_admin_user, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
  end

  # GET /documents/1
  # GET /documents/1.json
  def show # becomes download
    @document = Document.find(params[:id])
    # send_data @document.data, :filename => @document.filename, 
    #                           :type => @document.content_type, 
    #                           :disposition => "inline"
    send_data @document.data, :filename => @document.filename, 
                              :type => @document.content_type
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
    # puts "*|*|"*20
    # puts params[:document][:data].original_filename
    # puts params[:document][:data].content_type
    # puts document_params[:data].original_filename
    # puts document_params[:data].content_type
    # puts "*^*^"*20
    @document = Document.new
    @document.name = document_params[:name]
    @document.lab_id = document_params[:lab_id]
    @document.data = document_params[:data].read
    @document.filename = sanitize_filename(document_params[:data].original_filename)
    @document.content_type = document_params[:data].content_type


    respond_to do |format|
      if @document.save
        format.html { redirect_to documents_url, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: documents_url }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update_attributes(name: document_params[:name], lab_id: document_params[:lab_id])
        format.html { redirect_to documents_url, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: documents_url }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:name, :data, :lab_id)
    end

    def sanitize_filename(filename)
      #get only the filename, not the whole path (from IE)
      just_filename = File.basename(filename)
      #replace all non-alphanumeric, underscore or periods with underscores
      just_filename.gsub(/[^\w\.\-]/, '_')
    end

end
