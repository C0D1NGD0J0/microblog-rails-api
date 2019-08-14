class ArticlePolicy < ApplicationPolicy
	def create?
		user.role == 'editor' || user.role == 'admin'
	end

	def update?
		user.role == 'admin' || record.user == user
	end

	def destroy?
		user.role == 'admin' 
	end
end