package com.my.hr.service;

import java.time.LocalDate;
import java.util.List;

import com.my.hr.domain.Laborer;

public interface LaborerService {
	Laborer getLaborer(int LaborerId);
	List<Laborer> getLaborers();
	void addLaborer(String laborerName, LocalDate HireDate);
	void fixLaborer(Laborer laborer);
	void delLaborer(int laborerId);
}
