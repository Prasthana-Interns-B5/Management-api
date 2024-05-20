# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ReferenceDatum.create_or_find_by!(data_type: 'role', key: 'ur_hr', label: 'Hr')
ReferenceDatum.create_or_find_by!(data_type: 'role', key: 'ur_manager', label: 'Manager')
ReferenceDatum.create_or_find_by!(data_type: 'role', key: 'ur_sr_software', label: 'Senior Software')
ReferenceDatum.create_or_find_by!(data_type: 'role', key: 'ur_lead', label: 'Lead')
ReferenceDatum.create_or_find_by!(data_type: 'role', key: 'ur_software_engineer', label: 'Software Engineer')
