class CdrsController < ApplicationController
  
  layout 'application'

  def index
    @filter = params[:date_filter].nil? ? "this_month" :  params[:date_filter]
    dates = get_date_range(@filter)
    
    @seller_rates = SellerRate.all :conditions => ["apply_to_id = ? ",
      current_user.business_class
    ]
    @cdrs = {}

    @seller_rates.each do |seller_rate|
      cdr_records = Cdr.all :conditions => ["billsec > 0 AND dst like ? AND accountcode = ? AND calldate BETWEEN  ? AND ? AND ( dstchannel like ? OR dstchannel like ? )",
        "#{seller_rate.prefix}%",
        current_user.account_code,
        dates[0].strftime("%Y-%m-%d"),
        dates[1].strftime("%Y-%m-%d"),
        'SIP/Voiceworks%',
        'SIP/Voicetrading%'
      ]
      @cdrs[seller_rate.id] = cdr_records
    end
  end
  
end
