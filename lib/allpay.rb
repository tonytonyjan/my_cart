class Allpay
  attr_accessor :merchant_id, :hash_key, :hash_iv

  def initialize merchant_id: '2000132', hash_key: '5294y06JbISpM5x9', hash_iv: 'v77hoKGq4kWxNNIS'
    @merchant_id = merchant_id
    @hash_key = hash_key
    @hash_iv = hash_iv
  end

  def make_mac params = {}
    原始字串 = params.sort.map!{|ary| "#{ary.first}=#{ary.last}"}.join('&')
    前後綴 = "HashKey=#{@hash_key}&#{原始字串}&HashIV=#{@hash_iv}"
    網址編碼 = CGI.escape(前後綴).downcase!
    Digest::MD5.hexdigest(網址編碼).upcase!
  end
end