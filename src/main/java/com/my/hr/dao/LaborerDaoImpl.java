package com.my.hr.dao;

import java.time.LocalDate;
import java.util.List;

import com.my.hr.config.Configuration;
import com.my.hr.dao.map.LaborerMap;
import com.my.hr.domain.Laborer;

public class LaborerDaoImpl implements LaborerDao{
	private LaborerMap laborerMap;
	
	public LaborerDaoImpl() {
		this.laborerMap = Configuration.getMapper(LaborerMap.class);
	}
	
	@Override
	public Laborer selectLaborer(int laborerId){
		return laborerMap.selectLaborer(laborerId);
	}
	
	@Override
	public List<Laborer> selectLaborers(){
		return laborerMap.selectLaborers();
	}
	
	@Override
	public void insertLaborer(String laborerName, LocalDate HireDate) {
		laborerMap.insertLaborer(laborerName, HireDate);
	}
	
	@Override
	public void updateLaborer(Laborer laborer) {
		laborerMap.updateLaborer(laborer);
	}
	
	@Override
	public void deleteLaborer(int laborerId) {
		laborerMap.deleteLaborer(laborerId);
	}
}
