class ShippingCost < ActiveHash::Base
  self.data = [
    { id: 1, name: 'Shipping Cost 1' },
    { id: 2, name: 'Shipping Cost 2' },
    { id: 3, name: 'Shipping Cost 3' },
    # 別の配送料を追加する場合は、ここにデータを追加します
  ]
end
