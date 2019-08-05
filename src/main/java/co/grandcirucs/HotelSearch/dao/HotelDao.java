package co.grandcirucs.HotelSearch.dao;

import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import co.grandcirucs.HotelSearch.entity.Hotel;

@Repository
@Transactional
public class HotelDao {

	@PersistenceContext
	EntityManager em;
	
	public List<Hotel> findByCity(String city, Integer maxPrice) {
		return em.createQuery("FROM Hotel WHERE city = :city AND pricePerNight < :maxPrice ORDER BY pricePerNight", Hotel.class)
				.setParameter("city", city).setParameter("maxPrice", maxPrice)
				.getResultList();
	}
	
	public Set<String> findAllCities() {
		List<String> list = em.createQuery("SELECT DISTINCT city FROM Hotel", String.class)
				.getResultList();
		return new TreeSet<>(list);
	}
	
	public Hotel findById(Long id) {
		return em.find(Hotel.class, id);
	}
	
	public void update(Hotel hotel) {
		em.merge(hotel);
	}
}
