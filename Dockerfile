FROM node:latest

# Default port, used in index.js
EXPOSE 3000

# Add package.json to use cache properly
# Since caches are based on file diffs, cache will be discarded
# if any added file was changed. By prioritizing package.json we
# wood keep cache unless package.json changed itself
ADD package.json /src/package.json

# Installing node modules
RUN cd /src && npm install

# Add rest files
ADD . /src

# Set NODE_ENV environment to distinct configurations
ENV NODE_ENV docker

# Command to run container - only one allowed
CMD ["node", "/src/index.js"]
