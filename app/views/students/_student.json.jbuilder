json.extract! student, :id, :group_id, :subject_id, :name, :lastname, :tel1, :tel2, :street, :numberhome, :suburb, :registrationnumber, :banknumber, :account_id, :created_at, :updated_at
json.url student_url(student, format: :json)
