package co.grandcirucs.HotelSearch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import co.grandcirucs.HotelSearch.dao.HotelDao;
import co.grandcirucs.HotelSearch.entity.Hotel;

@Controller
public class HotelSearchController {
	
	@Autowired
	HotelDao dao;
	
	@RequestMapping("/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("cities", dao.findAllCities());
		return mav;
	}
	
	@RequestMapping("/hotels")
	public ModelAndView hotels(
			@RequestParam(name="city") String city,
			@RequestParam(name="maxPrice") Integer maxPrice) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("city", city);
		mav.addObject("hotels", dao.findByCity(city, maxPrice));
		return mav;
	}
	
	@RequestMapping("/details")
	public ModelAndView details(
			@RequestParam(name="id") Long id) {
		Hotel hotel = dao.findById(id);
		ModelAndView mav = new ModelAndView("details");
		mav.addObject("hotel", hotel);
		return mav;
	}
	
	@RequestMapping("/upvote")
	public ModelAndView upvote(
			@RequestParam(name="id") Long id) {
		Hotel hotel = dao.findById(id);
		hotel.setRating(hotel.getRating()+1);
		dao.update(hotel);
		return new ModelAndView("redirect:/hotels?city=" + hotel.getCity() + "&maxPrice=" + 1000000, "hotel", hotel);
	}
	
	@RequestMapping("/downvote")
	public ModelAndView downvote(
			@RequestParam(name="id") Long id) {
		Hotel hotel = dao.findById(id);
		hotel.setRating(hotel.getRating()-1);
		dao.update(hotel);
		return new ModelAndView("redirect:/hotels?city=" + hotel.getCity() + "&maxPrice=10000000", "hotel", hotel);
	}
}
