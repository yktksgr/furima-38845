class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: 'Category 1' },
    { id: 2, name: 'Category 2' },
    { id: 3, name: 'Category 3' },
    # 別のカテゴリーを追加する場合は、ここにデータを追加します
  ]
end