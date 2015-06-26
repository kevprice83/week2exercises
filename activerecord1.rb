# SL7. Valid students are valid students

# You loved the example about students, huh? Let’s student you up then!

# So we are going to do some implementation on this Student class with the following:
# 1. Add a “complete_name” method.
# 2. Add some more validations of your own. For example, we won’t accept students born before 1970 that have more
# than one dog, and we also won’t accept students which have “Llorenç" and "Sharon" name, because we want them to be the only ones in Ironhack <3
# the same with “Nick”, because we love him starting at us doing yoga)
# 3. Finally, remove all the ActiveRecord validations and implement them on your own with the “validate” DSL method. Let’s go, folks!

# Note: you will find a student.rb template file and the student.sqlite database in Slack.

require 'rubygems'
require 'active_record'
#require 'active_model'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'activerecord.sqlite'
)


#class MyValidator::Validator

#	def validate(birthday)
#		unless age <= 45
#			age.errors[:age] 'you are too old!'
#		end
#	end
#end
#end
class Student < ActiveRecord::Base
  # we have name, surnames, birthday, website, number_of_dogs
  # and first_programming_experience

  #include ActiveModel::Validations

  AGE_MINIMUM = 16
  #validates_with MyValidator

  validates_presence_of :name, :surnames
  validates_format_of :website, with: /\Ahttp:/
  validates_numericality_of :number_of_dogs, greater_than: 0
  validate :proper_age
  validate :name_check
  validate :programming_experience
  private

  def proper_age
  	return unless birthday.present?

    unless birthday < AGE_MINIMUM.years.ago
      errors.add(:birthday, 'is too young')
    end
  end

  def name_check
  	if name == "Llorenç" || name == "Sharon"
  		errors.add(:name, 'Go back to IronHack mutha fugga!!')
  	end
  end

  def programming_experience
  	unless first_programming_experience
  		errors.add(:first_programming_experience, 'You need more training young Padawan.')
  	end
  end
end

s1 = Student.new name: 'Kevin', surnames: 'Price',
  website: 'http://amoveablefeastblog.org', birthday: 31.years.ago,
  number_of_dogs: 1, first_programming_experience: true
s1.save
p s1.valid?
p s1.errors
