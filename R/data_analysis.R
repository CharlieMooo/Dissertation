install.packages("knitr")
install.packages("tidyverse")


## The code here can be modified to show the result of different variables

## Load the packages and read the shapefile
```{r}

library(spatstat)
library(sp)
library(rgeos)
library(maptools)
library(GISTools)
library(tmap)
library(sf)
library(geojson)
library(geojsonio)
library(tmaptools)
library(here)
library(janitor)
library(dplyr)
library(knitr)
library(tidyverse)
#read the ward data in
LondonWards <- st_read("wards_with_attributes.shp")

st_crs(LondonWards)
```


## Plot to check the map 
```{r}
tmap_mode("plot")
tm_shape(LondonWards) +
  tm_polygons(col = NA, alpha = 0.5)
```



## Read CSV file
```{r}
WardData <- read_csv("ward_data.csv", 
                     na = c("NA", "n/a")) %>% 
                     clean_names()
                     
LondonWards <- LondonWards %>% 
  left_join(WardData, 
            by = c("Ward.Name" = "name"))%>%
  dplyr::distinct(GSS_CODE, .keep_all = T)%>%
  dplyr::select(GSS_CODE, NAME, density, total0, total00) 
```


## Plot the map with attributes (can be adjusted to display different attributes)

pdf(file="seller.pdf", bg="transparent")
```{r}
university <- read.csv("London_Universities.csv")
university_sf <- st_as_sf(university, 
                           coords = c("x","y"), 
                           crs = 27700)


tm_shape(LondonWards) +
    tm_polygons("total0",
        style="jenks",
        palette="YlOrBr",
        transparency=0.1,
        midpoint=NA,
        popup.vars=c("name", "total0"),
        title="Consumers' deal rate",
        textNA="No International Students") +
    tm_compass(type = "4star", position=c("left", "top"),size=2.5) +
  tm_shape(university_sf) + tm_dots(col = "name",size = "ratio",shape=8,size.max= 0.3,legend.show = FALSE,legend.size.show = FALSE,style="pretty")



```


## Plot the central points of each wards
```{r}
library(spdep)

coordsW <- LondonWards%>%
  st_centroid()%>%
  st_geometry()

plot(coordsW,axes=TRUE)
```


## Create links of neighbors among wards for Moran's I
```{r}
#create a neighbours list
LWard_nb <- LondonWards %>%
  poly2nb(., queen=T)

summary(LWard_nb)

#plot them
plot(LWard_nb, st_geometry(coordsW), col="red")
#add a map underneath
plot(LondonWards$geometry, add=T)
```


## Create the spatial weights and do Moran's I
```{r}
Lward.lw <- LWard_nb %>%
  nb2listw(., style="C", zero.policy = TRUE)

I_LWard_Global_Deal <- LondonWards %>%
  pull(total0) %>%
  as.vector()%>%
  moran.test(., Lward.lw, na.action=na.exclude, zero.policy=TRUE)

I_LWard_Global_Deal
```


## Do local Moran's I and record the values of local moran's I 
```{r}
I_LWard_Local_Deal <- LondonWards %>%
  pull(total0) %>%
  as.vector()%>%
  localmoran(., Lward.lw, na.action=na.exclude, zero.policy=TRUE)%>%
  as_tibble()

slice_head(I_LWard_Local_Deal, n=5)

LondonWards <- LondonWards %>%  
  mutate(deal_I =as.numeric(I_LWard_Local_Deal$Ii))%>%
  mutate(deal_Iz =as.numeric(I_LWard_Local_Deal$Z.Ii))
  
```


## Plot the result of local Moran's I
```{r}
breaks1<-c(-1000,-2.58,-1.96,-1.65,1.65,1.96,2.58,1000)

MoranColours<- rev(brewer.pal(8, "RdBu"))

tm_shape(LondonWards) +
    tm_polygons("deal_Iz",
        style="fixed",
        breaks=breaks1,
        palette=MoranColours,
        midpoint=NA,
        title="Local Moran's I, consumer deal rates")
```


## Do OLS between deal rates and international students density
```{r}
library(correlationfunnel)
library(broom)


myvars <- LondonWards %>%
  dplyr::select(GSS_CODE, NAME, density, total0, total00)

model_final <- lm(total0 ~ density,
                  data = myvars)

tidy(model_final)

```


## Convert the data to "spatial"
```{r}
library(spgwr)

st_crs(LondonWards) = 27700

LonWardProfilesSP <- na.exclude(LondonWards)

LonWardProfilesSP <- LonWardProfilesSP %>%
  as(., "Spatial")

st_crs(coordsW) = 27700
coordsWSP <- coordsW %>%
  as(., "Spatial")

coordsWSP
```


## Calculate kernel bandwidth
```{r}
GWRbandwidth <- gwr.sel(total0 ~ density, 
                  data = LonWardProfilesSP, 
                        coords=coordsWSP,
                        adapt=T)
```


## Do the GWR
```{r}
#run the gwr model
gwr.model = gwr(total0 ~ density, 
                  data = LonWardProfilesSP, 
                coords=coordsWSP, 
                adapt=GWRbandwidth, 
                hatmatrix=TRUE, 
                se.fit=TRUE)

#print the results of the model
gwr.model
```


## Attach coefficients of independent variable to the original SF
```{r}
results <- as.data.frame(gwr.model$SDF)
names(results)

LondonWards1 <- na.omit(LondonWards)

LonWardProfiles2 <- LondonWards1 %>%
  mutate(coefDensity = results$density)

LonWardProfiles2 <- LondonWards %>% st_join(LonWardProfiles2,by = c("GSS_CODE" = "GSS_CODE"))
```


## Plot the coefficients of independent variable
```{r}

tm_shape(LonWardProfiles2) +
  tm_polygons(col = "coefDensity", 
              palette = "RdBu", 
              alpha = 0.5,
              textNA="No International Students",
              title="(Consumer) Coefficient of density")
```

