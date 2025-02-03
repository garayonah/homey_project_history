# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#Create Users
user1 = User.create! username: "yonah", email_address: "yg@email.com", password: "abc123", password_confirmation: "abc123"
user2 = User.create! username: "person", email_address: "person_2@email.com", password: "abc123", password_confirmation: "abc123"
user3 = User.create! username: "colleague", email_address: "colleague@email.com", password: "abc123", password_confirmation: "abc123"

#Create Project
project = Project.create!(name: "Project History Sample Discussion", status: "open")

#Create Conversation Example
ProjectHistory.create!(project: project, user: user1, status_before: 'initial', status_after: 'initial', comment: 'Is this going to be used for one project or multiple?')

ProjectHistory.create!(project: project, user: user2, status_before: 'initial', status_after: 'open', comment: 'Lets make it possible for multiple.')
project.update(status: 'open')

ProjectHistory.create!(project: project, user: user1, status_before: 'open', status_after: 'open', comment: 'What statuses should be allowed?')

ProjectHistory.create!(project: project, user: user3, status_before: 'open', status_after: 'open', comment: 'Until a definitive list is chosen, leave it open to the user')

ProjectHistory.create!(project: project, user: user1, status_before: 'open', status_after: 'pending_approval', comment: 'Anything else pressing for now?')
project.update(status: 'pending_approval')

ProjectHistory.create!(project: project, user: user3, status_before: 'open', status_after: 'closed', comment: 'We shall close the project now until further notice')
project.update(status: 'closed')