class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: '新品、未使用' },
    { id: 2, name: '未使用に近い' },
    { id: 3, name: '目立った傷や汚れなし' },
    { id: 4, name: 'やや汚れあり' },
    { id: 5, name: '全体的に状態悪い' }
  ]

  include ActiveHash::Associations
  has_many :items
end
