# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'json'

client = JIRA::Client.new :site => "https://katsdc.atlassian.net",
                          :auth_type => :basic,
                          :username => ENV['USERNAME'],
                          :password => ENV['PASSWORD'],
                          :context_path => "",
                          :use_ssl => true

response = client.Group.find 'jira-developers'
issues = client.Issue.jql('')

response.attrs["users"]["items"].map do |developer|
  Developer.find_or_create_by developer_name: developer["displayName"], developer_email: developer["emailAddress"]
end

client.Project.all.map do |project|
  project_record = Project.find_or_create_by project_id: project.attrs["id"]
  project_record.update_attributes project_name: project.attrs["name"],
                                   number_issues: project.issues.count
end

issues = client.Issue.jql('')

@tickets = issues.map do |ticket|
  # puts JSON.pretty_generate(JSON.parse(ticket.to_json))
  ticket_record = Ticket.find_or_create_by ticket_id: ticket.attrs["id"],
                                           project_id: ticket.attrs["fields"]["project"]["id"]
  ticket_record.update_attributes title: ticket.attrs["fields"]["summary"],
                                  description: ticket.attrs["fields"]["description"],
                                  task_type: ticket.attrs["fields"]["issuetype"]["name"],
                                  status: ticket.attrs["fields"]["status"]["name"],
                                  priority: ticket.attrs["fields"]["priority"]["name"],
                                  estimate: ticket.attrs["fields"].try(:[], "timeestimate"),
                                  time_spent: ticket.attrs["fields"].try(:[], "timespent"),
                                  progress: ticket.attrs["fields"]["progress"].try(:[], "percent"),
                                  assignee: ticket.attrs["fields"]["assignee"].try(:[], "displayName"),
                                  developer: Developer.find_by(developer_email: ticket.attrs["fields"]["assignee"].try(:[], "emailAddress"))
end