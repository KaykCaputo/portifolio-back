FROM node:20-alpine AS builder

WORKDIR /app

ENV NODE_ENV=build
ADD package*.json ./
RUN npm ci

COPY src src
COPY tsconfig.json ./

RUN npm run build

FROM node:20-alpine
WORKDIR /app

ADD package*.json ./
RUN npm i

COPY --from=builder /app/dist/ dist/
EXPOSE 3000
ENTRYPOINT [ "npm", "start" ]