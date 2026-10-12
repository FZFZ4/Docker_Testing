###############################
####### BUILDING PHASE ########
###############################

FROM node:alpine AS builder  

WORKDIR /app

COPY ./package.json ./
RUN npm install 

COPY ./ ./ 

RUN npm run build


###############################
####### RUNNING PHASE #########
###############################


FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html




