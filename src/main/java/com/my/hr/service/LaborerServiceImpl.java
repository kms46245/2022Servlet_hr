package com.my.hr.service;

import java.time.LocalDate;
import java.util.List;

import com.my.hr.dao.LaborerDao;
import com.my.hr.dao.LaborerDaoImpl;
import com.my.hr.domain.Laborer;

public class LaborerServiceImpl implements LaborerService{
	private LaborerDao laborerDao;
	
	public LaborerServiceImpl() {
		this.laborerDao = new LaborerDaoImpl();
	}
	
	@Override
	public Laborer getLaborer(int laborerId){
		return laborerDao.selectLaborer(laborerId);
	}
	
	@Override
	public List<Laborer> getLaborers(){
		return laborerDao.selectLaborers();
	}
	
	@Override
	public void addLaborer(String laborerName, LocalDate HireDate) {
		laborerDao.insertLaborer(laborerName, HireDate);
	}
	

	@Override
	public void fixLaborer(Laborer laborer) {
		laborerDao.updateLaborer(laborer);
	}
	
	@Override
	public void delLaborer(int laborerId) {
		laborerDao.deleteLaborer(laborerId);
	}
}
