class History < ActiveHash::Base
  self.data = [
    {id: 0, name: '---'}, 
    {id: 1, name: '初心者'}, 
    {id: 2, name: '1年'},
    {id: 3, name: '2年'},
    {id: 4, name: '3年'}, 
    {id: 5, name: '4年'},
    {id: 6, name: '5年以上'},
    {id: 7, name: '10年以上'},
    {id: 8, name: '20年以上'},
  ]

  include ActiveHash::Associations
  has_many :users
  
end