# Task for translating names of cities from dadata
namespace :translate_cities do
  task :translate_rostov => :environment do
    events = Event.where(city: 'Ростов-на-Дону')
    events.each do |e|
      e.update!(city: 'Rostov-on-Don')
    end
  end

  task :translate_taganrog => :environment do
    events = Event.where(city: 'Таганрог')
    events.each do |e|
      e.update!(city: 'Taganrog')
    end
  end
end
