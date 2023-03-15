# build VUE3 app
FROM node:lts-alpine as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# build golang app
FROM golang:1.20-alpine AS deploy
WORKDIR /app
COPY main.go go.* /app/

COPY --from=build /app/dist /app/dist/

RUN CGO_ENABLED=0 go build -o /bin/kubeboard

CMD ["/bin/kubeboard", "--port", "8001"]