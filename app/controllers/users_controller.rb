class UsersController < ApplicationController
  def injectable
    if params[:id]
      sql = "SELECT * FROM users where id = #{params[:id]}"
      render json: User.find_by_sql(sql)
    elsif params[:user_name]
      render json: User.where(username: params[:user_name])
    elsif params[:first_name]
      render json: User.where("first_name = '#{params[:first_name]}'")
    elsif params[:last_name]
      render json: User.where(last_name: params[:last_name])
    else
      render json: User.all
    end
  end

  def not_injectable
    if params[:id]
      render json: User.where(id: params[:id])
    elsif params[:user_name]
      render json: User.where(username: params[:user_name])
    elsif params[:first_name]
      render json: User.where(first_name: params[:first_name])
    elsif params[:last_name]
      render json: User.where(last_name: params[:last_name])
    else
      render json: User.all
    end
  end
end
