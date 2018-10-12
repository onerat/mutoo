class User < ActiveRecord::Base
  #권한부여추가(student라는 역할부여)
  after_create :assign_default_role
  def assign_default_role
    add_role(:student)
  end
  rolify
  has_many :works
  has_many :wcomments
  has_many :frees
  has_many :fcomments
  has_many :wlikes
  has_many :extras
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save {self.email = email.downcase}                                     #이메일을 저장하기 전, 주소를 소문자로 변환
  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i        #정규식을 이용해 이메일 형식을 지정
  validates :name, presence: true, length: {maximum: 15}                        #이름과 이메일이 반드시 존재하고 15,255자를 넘지 않게하는 유효성검사
  validates :email, presence: true, length: {maximum: 255},                     #validates (존재를 확인), presence(오직 하나만 존재),
          format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}   #uniqueness(이메일소문자)
  validates :nickname, presence: true, length: {maximum: 15}
  
  def is_wlike?(work)
    Wlike.find_by(user_id: self.id, work_id: work.id).present?
  end
end
