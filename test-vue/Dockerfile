FROM node:16-alpine3.15

WORKDIR /webapp

# 很多时候我们可能只是改变了代码，并没有改变依赖项，但是这却导致了npm install需要重新执行
# 这是因为当某一层发生变化时，这个层后面的所有层都将被清除缓存并且需要重新执行指令
# 因此我们需要确保我们的安装依赖项的指令在我们复制源代码的指令之前
# 这样在将来我们更改源代码的时候，不会让npm install这一层的缓存结果失效
# 这是一个小小的优化，但更重要的是需要明白为什么要这样做
# bad
# COPY . .
#
# RUN npm install

# good
COPY package*.json .

RUN npm install

COPY . .

RUN npm run build


FROM nginx:alpine

COPY --from=0 /webapp/dist /usr/share/nginx/html

COPY --from=0 /webapp/docker-run.sh /docker-run.sh

# COPY /nginx/nginx.conf /etc/nginx/nginx.conf

# ENV NODE_ENV=development

ENTRYPOINT [ "sh", "/docker-run.sh" ]