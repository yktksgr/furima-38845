class Prefecture < ActiveHash::Base
  self.data = [
    { id: 1, name: 'Prefecture 1' },
    { id: 2, name: 'Prefecture 2' },
    { id: 3, name: 'Prefecture 3' },
    # 別の都道府県を追加する場合は、ここにデータを追加します
  ]
end