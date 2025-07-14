FROM node:iron-bullseye
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build
EXPOSE 3003
ENTRYPOINT ["bin/docker-entrypoint.sh"]
CMD ["run"]
