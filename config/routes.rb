Rails.application.routes.draw do
  get("/", { :controller => "application", :action => "homepage" })

  get("/movies/casablanca", { :controller => "movies", :action => "casablanca" })
  
  get("/movies/before2000", { :controller => "movies", :action => "before2k" })
  
  get("/directors/youngest", { :controller => "directors", :action => "last" })
  
  get("/directors/less_than_55", { :controller => "directors", :action => "under_55" })
  
  get("/directors/coppola", { :controller => "directors", :action => "francis" })
  
  get("/actors/freeman", { :controller => "actors", :action => "morgan" })
end
