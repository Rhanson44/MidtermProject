package com.skilldistillery.nationalparks.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.nationalparks.entities.Animal;
import com.skilldistillery.nationalparks.entities.NationalPark;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class NationalParkDAOImpl implements NationalParkDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public NationalPark findById(int id) {
		return em.find(NationalPark.class, id);
	}

	@Override
	public List<NationalPark> findAll() {
		return em.createQuery("SELECT n FROM NationalPark n", NationalPark.class).getResultList();
	}

	@Override
	public Animal create(Animal newAnimal) {
	
			
			em.persist(newAnimal);
			em.flush();
			return newAnimal;
		
		}

	}



