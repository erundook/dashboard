class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :email
      t.string :title
      t.date :hired_at
      t.string :avatar

      t.timestamps
    end
  end
end
