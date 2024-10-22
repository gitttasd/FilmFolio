package com.film.folio.movie;

import java.util.List;

public class ActorVo {
	private int id;
	private int gender;
	private List<MovieVo> known_for;
	private String known_for_department;
	private String name;
	private String profile_path;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public List<MovieVo> getKnown_for() {
		return known_for;
	}
	public void setKnown_for(List<MovieVo> known_for) {
		this.known_for = known_for;
	}
	public String getKnown_for_department() {
		return known_for_department;
	}
	public void setKnown_for_department(String known_for_department) {
		this.known_for_department = known_for_department;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProfile_path() {
		return profile_path;
	}
	public void setProfile_path(String profile_path) {
		this.profile_path = profile_path;
	}
	
	
	
	

}
