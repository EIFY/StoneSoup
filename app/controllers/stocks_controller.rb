require 'bigdecimal'

class StocksController < ApplicationController
  # GET /stocks
  # GET /stocks.json
  def index
    @stocks = Stock.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stocks }
    end
  end

  # GET /stocks/1
  # GET /stocks/1.json
  def show
    @stock = Stock.find(params[:id])
    @quote = YahooFinance::get_standard_quotes(@stock.ticker)[@stock.ticker]
    @tweets = Twitter.search('$' + @stock.ticker).results

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stock }
    end
  end

  # GET /stocks/new
  # GET /stocks/new.json
  def new
    @stock = Stock.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stock }
    end
  end

  # POST /stocks
  # POST /stocks.json
  def create
    
    ticker = params[:stock][:ticker].upcase
    @stock = Stock.find_or_create_by_ticker(ticker)
    
    respond_to do |format|
      if @stock.valid?
        format.html { redirect_to @stock, notice: 'Stock was successfully created.' }
        format.json { render json: @stock, status: :created, location: @stock }
      else
        format.html { render action: "new" }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

end
