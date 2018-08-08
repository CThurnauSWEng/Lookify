package com.carthurnau.lookify.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.carthurnau.lookify.models.Song;
import com.carthurnau.lookify.repositories.SongRepository;

@Service
public class SongService {

	private final SongRepository songRepository;
	
	public SongService(SongRepository songRepository) {
		this.songRepository = songRepository;
	}
	
	public List<Song> allSongs() {
		return songRepository.findAll();
	}
	
	public Song createSong(Song song) {
		return songRepository.save(song);
	}
	
	public Song findSong(Long id) {
		Optional<Song> optionalSong = songRepository.findById(id);
		
		if (optionalSong.isPresent()) {
			return optionalSong.get();
		} else {
			return null;
		}
	}
	
	public List<Song> findByArtist(String artist){
		List<Song> songList = songRepository.findByArtist(artist);
		return songList;
	}
	
	public Song updateSong(Song song) {
		return songRepository.save(song);
	}
	
	public void deleteSong(Long id) {
		songRepository.deleteById(id);
	}

	public List<Song> findTopSongs() {
		return songRepository.findFirst10ByOrderByRatingDesc();
	}
}

