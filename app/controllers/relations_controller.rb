# -*- coding: utf-8 -*-
class RelationsController < ApplicationController
  def create
    @relation = Relation.new(params[:relation])
    @relation.user = current_user

    respond_to do |format|
      if @relation.save
        format.html { redirect_to :back, notice: "参加情報が登録されました！" }
        format.json { render json: @relation, status: :created, location: @relation }
      else
        format.html { render action: "new" }
        format.json { render json: @relation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @relation = Relation.find(params[:id])

    respond_to do |format|
      if @relation.update_attributes(params[:relation])
        format.html { redirect_to @relation, notice: "参加情報が更新されました！" }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @relation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @relation = Relation.find(params[:id])

    return unless signed_in?
    return unless @relaton.user == current_user

    @relation.destroy

    respond_to do |format|
      format.html { redirect_to relations_url }
      format.json { head :ok }
    end
  end
end
