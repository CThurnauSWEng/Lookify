package com.carthurnau.lookify.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.carthurnau.lookify.models.Song;
import com.carthurnau.lookify.services.SongService;

@Controller
public class homeController {
	
	private final SongService songService;
	
	public homeController(SongService songService) {
		this.songService = songService;
	}
	
	@RequestMapping("")
	public String index() {
		return "index.jsp";
	}
	
	@RequestMapping("/dashboard")
	public String showDashboard(Model model) {

		// go get all of the songs from the db
		List<Song> allSongs = songService.allSongs();
		model.addAttribute("allSongs", allSongs);
		
		return "dashboard.jsp";
	}
	
	@RequestMapping("/newForm")
	public String renderNewForm(Model model) {
		
		// create a song object for the edit form to use
		Song song = new Song();
		model.addAttribute("song",song);
		return "newSongForm.jsp";
	}

	@RequestMapping(value = "/new", method = RequestMethod.POST)
	public String processNew(@Valid @ModelAttribute("song") Song song, BindingResult result) {
		if (result.hasErrors()) {
			return "newSongForm.jsp";
		} else {
			songService.createSong(song);
			return "redirect:/dashboard";
		}
	}
	
	@RequestMapping(value = "/edit/{id}")
	public String displayEditForm(@PathVariable("id") Long id, Model model) {
		Song song = songService.findSong(id);
		model.addAttribute(song);
		return "editForm.jsp";
	}
	
	@RequestMapping(value = "/processEdit/{id}", method = RequestMethod.POST)
	public String processEdit(@PathVariable("id") Long id, @Valid @ModelAttribute("song") Song song, BindingResult result) {
		if (result.hasErrors()) {
			return "/edit/" + id;
		} else {
			song.setId(id);
			songService.updateSong(song);
			return "redirect:/dashboard";
		}
		
	}
	
	@RequestMapping(value = "/delete/{id}")
	public String deleteSong(@PathVariable("id") Long id) {
		songService.deleteSong(id);
		return "redirect:/dashboard";
	}
	
	@RequestMapping(value = "/{id}")
	public String showSong(@PathVariable("id") Long id, Model model) {
		Song song = songService.findSong(id);
		model.addAttribute("song", song);
		return "showSong.jsp";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String searchArtist(Model model, @RequestParam(value="artist") String artist) {

		List<Song> songList = songService.findByArtist(artist);
		model.addAttribute("songList",songList);
		model.addAttribute("artist",artist);
		
		for (Song song : songList) {
			System.out.println(song.getTitle());
		}
		return "showSongList.jsp";
	}
	
	@RequestMapping(value = "/showTopSongs")
	public String getTopSongs(Model model) {
		
		List<Song> songList = songService.findTopSongs();
		model.addAttribute("songList",songList);
		
		return "showTopSongs.jsp";
		
	}

}
