class Allpay
  attr_accessor :merchant_id, :hash_key, :hash_iv

  def initialize merchant_id: '2000132', hash_key: '5294y06JbISpM5x9', hash_iv: 'v77hoKGq4kWxNNIS'
    @merchant_id = merchant_id
    @hash_key = hash_key
    @hash_iv = hash_iv
  end

  def make_mac params = {}
    raw = params.sort.map!{|ary| "#{ary.first}=#{ary.last}"}.join('&')
    padding = "HashKey=#{@hash_key}&#{raw}&HashIV=#{@hash_iv}"
    url_encoded = CGI.escape(padding).downcase!
    Digest::MD5.hexdigest(url_encoded).upcase!
  end

  def check_mac params = {}
    stringified = params.stringify_keys
    check_mac_value = stringified.delete('CheckMacValue')
    make_mac(stringified) == check_mac_value
  end
end