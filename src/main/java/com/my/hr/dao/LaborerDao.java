package com.my.hr.dao;

import java.time.LocalDate;
import java.util.List;

import com.my.hr.domain.Laborer;

public interface LaborerDao {
	Laborer selectLaborer(int employeeId);
	List<Laborer> selectLaborers();
	void insertLaborer(String laborerName, LocalDate HireDate);
	void updateLaborer(Laborer laborer);
	void deleteLaborer(int laborerId);
}
