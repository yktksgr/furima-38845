class PurchaseForm
  include ActiveModel::Model
  attr_accessor :hoge, :fuga

  # バリデーションの処理を書く

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end