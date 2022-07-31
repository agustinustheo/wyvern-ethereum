FROM mhart/alpine-node:10.24.1
RUN apk add git python3 alpine-sdk
WORKDIR /app
RUN npm uninstall yarn -g
RUN npm install -g yarn@1.8.0
COPY . .
RUN ls ./utxo-merkle-proof 
RUN rm ./yarn.lock
RUN rm ./utxo-merkle-proof/yarn.lock
RUN yarn
RUN yarn --cwd /app/utxo-merkle-proof
RUN cd utxo-merkle-proof && node ./generate.js
RUN yarn compile
RUN apk del git python3 alpine-sdk