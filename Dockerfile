FROM node:20-alpine AS builder

WORKDIR /app

ADD package*.json ./
RUN npm i typescript && npm install && npm install --only=dev

COPY src ./
COPY tsconfig.json ./

RUN npm run build

FROM node:20-alpine
WORKDIR /app

ADD package*.json ./
RUN npm i

COPY --from=builder /app/dist/ dist/
EXPOSE 3000
ENTRYPOINT [ "npm", "start" ]