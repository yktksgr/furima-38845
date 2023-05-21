class ShippingDate < ActiveHash::Base
  self.data = [
    { id: 1, name: 'Shipping Date 1' },
    { id: 2, name: 'Shipping Date 2' },
    { id: 3, name: 'Shipping Date 3' },
    # 別の発送日数を追加する場合は、ここにデータを追加します
  ]
end