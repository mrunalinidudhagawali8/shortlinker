package com.shortlinker.service;

import com.shortlinker.model.UrlMapping;
import com.shortlinker.repository.UrlMappingRepository;
import com.shortlinker.util.ShortCodeGenerator;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UrlShortenerService {

    @Autowired
    private UrlMappingRepository repository;

    @PostConstruct
    public void verifyMongo() {
        System.out.println("✅ Connected to MongoDB successfully!");
    }


    public String shortenUrl(String originalUrl) {
        Optional<UrlMapping> existingMapping = repository.findByOriginalUrl(originalUrl);
        if (existingMapping.isPresent()) {
            return existingMapping.get().getShortCode();
        }

        String shortCode;
        do {
            shortCode = ShortCodeGenerator.generateShortCode();
        } while (repository.existsById(shortCode));

        UrlMapping urlMapping = new UrlMapping(shortCode, originalUrl);
        repository.save(urlMapping);

        return shortCode;
    }

    public String getOriginalUrl(String shortCode) {
        Optional<UrlMapping> mapping = repository.findById(shortCode);
        if (mapping.isPresent()) {
            UrlMapping urlMapping = mapping.get();
            urlMapping.setHitCount(urlMapping.getHitCount() + 1);
            repository.save(urlMapping);
            return urlMapping.getOriginalUrl();
        }
        return null;
    }
}
