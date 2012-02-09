class CdrsController < ApplicationController
  
  layout 'application'

  def index
    @users = User.find(:all, :select => "id, email", :conditions => ["email != 'admin@admin.com'"])

    @user = User.find_by_id(params[:user]) if params[:user]
    unless @user
      @user = current_user
    end

    @filter = params[:date_filter].nil? ? "this_month" :  params[:date_filter]
    @date_from = params[:date_from].blank? ? "" : params[:date_from]
    @date_to = params[:date_to].blank? ? "" : params[:date_to]

    if params[:advance_filter_chk] == "true" and @date_from != "" and @date_from != ""
      @dates = [Date.strptime(@date_from, "%Y-%m-%d"), Date.strptime(@date_to, "%Y-%m-%d")]
    else
      @dates = get_date_range(@filter)
    end
    
    @seller_rates = SellerRate.all :conditions => ["apply_to_id = ? ", @user.business_class]
    @cdrs = {}

    p "*******************************"
    p @dates.inspect
    
    @seller_rates.each do |seller_rate|
      cdr_records = Cdr.all :conditions => ["dst like ? AND accountcode = ? AND calldate BETWEEN  ? AND ? AND ( dstchannel like ? OR dstchannel like ? )",
        "#{seller_rate.prefix}%",
        @user.account_code,
        @dates[0].strftime("%Y-%m-%d"),
        @dates[1].strftime("%Y-%m-%d"),
        'SIP/Voiceworks%',
        'SIP/Voicetrading%'
      ], :order => "calldate"
      
      @cdrs[seller_rate.id] = cdr_records
    end
    @cdrs = remove_duplication @cdrs
  end

  def remove_duplication cdrs
    cdrs.each do |key, array_values|
     cdrs.each do |com_key, com_array_values|
       unless key == com_key
         array_values.each do |element|
           com_array_values.each do |com_element|
             if element.uniqueid == com_element.uniqueid
                prefix = SellerRate.find_by_id(key).prefix
                com_prefix = SellerRate.find_by_id(com_key).prefix
                if prefix.length > com_prefix.length
                  com_array_values.delete(com_element)
                else
                  array_values.delete(element)
                end
             end
           end
         end
       end
     end
    end
    return cdrs
  end
end
