# Каждый инструкция (FROM, RUN, COPY) в Dockerfile создает новый слой образа, который кэшируется

# Specifies the base image for the Docker container
# используем инструкцию AS для именования образа development. Имя здесь может быть любым; оно предназначено только для того, чтобы позже ссылаться на образ
FROM node:20 As development

# Sets the working directory inside the container to /app
# каждая команда, которую выполняет Docker (определенная в инструкции RUN), будет выполняться в указанном контексте
WORKDIR /usr/src/app

# Copies the package.json and package-lock.json files from the current directory on the host machine to the /app directory in the container
COPY package*.json ./

# Installs the application dependencies in the container
RUN npm install

# Прописывает номер порта, на котором будет работать приложение
EXPOSE 3000

# Copies the application code from the host machine to the /app directory in the container
COPY . .

# Specifies the command to run when the container starts
CMD [ "npm", "run", "start:dev" ]