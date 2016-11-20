require 'sinatra'
require 'sinatra/cross_origin'
require 'json'

class SampleApp < Sinatra::Base
  register Sinatra::CrossOrigin

  # payment sales reports
  get '/payment_card_sales' do
    cross_origin
    content_type :json
    { '1' => 350, '2' => 400, '3' => 200 }.to_json
  end

  get '/payment_cash_sales' do
    cross_origin
    content_type :json
    { '1' => 50, '2' => 40, '3' => 25 }.to_json
  end

  get '/payment_other_sales' do
    cross_origin
    content_type :json
    { '1' => 3500, '2' => 4001 }.to_json
  end

  get '/payment_sales_summary' do
    cross_origin
    content_type :json
    {:data => [
        { :payment_method => 'Card', :qty => 200, :total => '100.34' },
        { :payment_method => 'Cash', :qty => 250, :total => '623.98' },
        { :payment_method => 'Other', :qty => 246, :total => '340.30' }
      ]
    }.to_json
  end

  # employee sales reports
  get '/employee_average_sales' do
    cross_origin
    content_type :json
    { :amount => '36, 642.76', :employeeName => 'Daniel Draper' }.to_json
  end

  get '/employee_gross_sales' do
    cross_origin
    content_type :json
    { :amount => '401.56', :employeeName => 'Ethan Jackwitz' }.to_json
  end

  get '/employee_total_sales' do
    cross_origin
    content_type :json
    { :amount => 180, :employeeName => 'Mark Biegel' }.to_json
  end

  get '/employee_sales_summary' do
    cross_origin
    content_type :json
    {:data => [
        { :name => 'Daniel Draper', :transactions => 250, :total => '5100.34' },
        { :name => 'Ethan Jackwitz', :transactions => 185, :total => '6968.55' },
        { :name => 'Mark Biegel', :transactions => 90, :total => '8340.30' }
      ]
    }.to_json
  end

  # item sales reports
  get '/top_item_sold' do
    cross_origin
    content_type :json
    { :name => 'Coffee', :amount => 2000 }.to_json
  end

  get '/top_item_sold_category' do
    cross_origin
    content_type :json
    { :name => 'Beverage', :taxon =>  'GST' }.to_json
  end

  get '/item_sales_summary' do
    cross_origin
    content_type :json
    {}.to_json
  end

  # sales summary
  get '/sales_summary' do
    cross_origin
    content_type :json
    { :data => [
        { :name => 'Gross Sales', :sales_total => '140,781.78', :refund_total => '0.00', :total => '140,781.78' },
        { :name => 'Discounts', :sales_total => '0.00', :refund_total => '0.00', :total => '0.00' },
        { :name => 'Net Sales', :sales_total => '128,032.95', :refund_total => '0.00', :total => '128,032.95' },
        { :name => 'Tax', :sales_total => '12,748.83', :refund_total => '0.00', :total => '12,748.83' },
        { :name => 'Card', :sales_total => '96,943.56', :refund_total => '0.00', :total => '96,943.56' },
        { :name => 'Cash', :sales_total => '12,867.05', :refund_total => '0.00', :total => '12,867.05' },
        { :name => 'Other', :sales_total => '30,971.17', :refund_total => '0.00', :total => '30,971.17' },
        { :name => 'Total', :sales_total => '140,781.78', :refund_total => '0.00', :total => '140,781.78' }
      ]
    }.to_json
  end

  # transactions
  get '/transactions_summary' do
    cross_origin
    content_type :json
    { :data => [
        { :name => 'TRANSACTIONS', :amount => 1656},
        { :name => 'GROSS SALES', :amount => '$384,056.83'},
        { :name => 'NET SALES', :amount => '$349,249.74'}
      ]
    }.to_json
  end

  get '/transactions' do
    cross_origin
    content_type :json
    {:data => [
        { :id => 1, :trx_datetime => 1474252084000, :type => 'cash', :order_no => 'R18-93D9AA8', :line_item_name => '60348 Cash Chermside', :amount => '50.00'},
        { :id => 2, :trx_datetime => 1474252084000, :type => 'credit', :order_no => 'R219-A528852', :line_item_name => '60494', :amount => '25.00'},
        { :id => 3, :trx_datetime => 1474165715000, :type => 'card', :order_no => 'R214-2347C1B', :line_item_name => '60497', :amount => '20.00'},
        { :id => 4, :trx_datetime => 1474165715000, :type => 'other', :order_no => 'R197-AAD3C1B', :line_item_name => '60407 CHQ Chermside', :amount => '45.00'}
      ]
    }.to_json
  end

  get '/transactions/:id' do
    cross_origin
    content_type :json
    { :employee_avatar_url => '',
      :employee_name => 'Fuzzy Lumpkin',
      :datetime => 1474252084000,
      :order_no => 'R18-93D9AA8',
      :line_items => [{:line_item_name => '60348 Cash Chermside', :amount => '$135.00'}],
      :delivery => '$0.00',
      :tax => '$12.27',
      :adjustments => '$0.00',
      :total => '$135.00'
    }.to_json
  end

  # employees
  get '/employees' do
    cross_origin
    content_type :json
    {:data => [
        {:id => 1, :avatar_url => '', :first_name => 'Daniel', :surname => 'Draper', :role => 'employee', :email => 'daniel@mytappr.com', :phone => '0412010001', :active => true},
        {:id => 2, :avatar_url => '', :first_name => 'Ethan', :surname => 'Jackwitz', :role => 'employee', :email => 'ethan@mytappr.com', :phone => '0412010002', :active => false},
        {:id => 3, :avatar_url => '', :first_name => 'Mark', :surname => 'Biegel', :role => 'employee', :email => 'mark@mytappr.com', :phone => '0412010003', :active => true},
        {:id => 4, :avatar_url => '', :first_name => 'Riana', :surname => 'Ferreira', :role => 'employee', :email => 'riana@mytappr.com', :phone => '0412010004', :active => true}
      ]
    }.to_json
  end

  get '/employees/:id' do
    cross_origin
    content_type :json
    { :avatar_url => '',
      :first_name => 'Fuzzy',
      :surname => 'Lumpkin',
      :role => 'employee',
      :email => 'fuzzy@mytappr.com',
      :phone => '0412010005',
      :active => true
    }.to_json
  end

  # library items
  get '/items' do
    cross_origin
    content_type :json
    {:data => [
        {:id => 1, :image_url => '', :name => 'Coffee', :category => 'Beverage', :price => '3.50'},
        {:id => 2, :image_url => '', :name => 'Tea', :category => 'Beverage', :price => '2.90'},
        {:id => 3, :image_url => '', :name => 'Juice', :category => 'Beverage', :price => '4.50'},
        {:id => 4, :image_url => '', :name => 'Smoothie', :category => 'Beverage', :price => '6.10'}
      ]
    }.to_json
  end

  get '/items/:id' do
    cross_origin
    content_type :json
    { :image_url => '',
      :name => 'Example Item',
      :category => '',
      :description => 'A library item aka product?',
      :active => true
    }.to_json
  end

  # library modifiers
  get '/modifiers' do
    cross_origin
    content_type :json
    {:data => [
        {:id => 1, :name => 'Milk', :options => [{:id => 1, :name => 'Skim'}, 
                                                 {:id => 2, :name => 'Soy'}, 
                                                 {:id => 3, :name => 'Almond'}]},
        {:id => 2, :name => 'Sweetner', :options => []},
        {:id => 3, :name => 'Caffeine', :options => []}
      ]
    }.to_json
  end

  get '/modifiers/:id' do
    cross_origin
    content_type :json
    {:id => 1,
     :name => 'Milk', 
     :options => [{:id => 1, :name => 'Skim', :amount => {:minor_units => 100, :currency_code => 'AUD'}}, 
                  {:id => 2, :name => 'Soy', :amount => {:minor_units => 20, :currency_code => 'AUD'}}, 
                  {:id => 3, :name => 'Almond', :amount => {:minor_units => 30, :currency_code => 'AUD'}}
                 ]}.to_json
  end

  # library categories
  get '/categories' do
    cross_origin
    content_type :json
    {:data => [
        {:id => 1, :name => 'Beverage'},
        {:id => 2, :name => 'Salads'},
        {:id => 3, :name => 'Clothing'}
      ]
    }.to_json
  end

  get '/categories/:id' do
    cross_origin
    content_type :json
    {:name => 'Beverage'}.to_json
  end

  # Library taxes
  get '/taxes' do
    cross_origin
    content_type :json
    {:data => [{:id => 1, :name => 'GST', :amount => '0.10'}]}.to_json
  end
end
