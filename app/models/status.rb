class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: 'Status 1' },
    { id: 2, name: 'Status 2' },
    { id: 3, name: 'Status 3' },
    # 別のステータスを追加する場合は、ここにデータを追加します
  ]
end