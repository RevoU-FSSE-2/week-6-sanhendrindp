# Dockerfile format : INSTRUCTION + arguments
# INSTRUCTION : perintah yg digunakan oleh Dockerfile
# arguments : data argument untuk INSTRUCTION yg diberikan

# FROM digunakan untuk membuat build stage awal dari image yg kita tentukan
# FROM imageName:version
FROM node:slim

# LABEL, instruksi untuk menambahkan detail informasi tambahan pada image
# LABEL <key>=<value>
LABEL author="Sanhendrin Dwi Prasetya"
LABEL website="https://sanhendrindp.site/"

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3001

# CMD / Command, intruksi yg digunakan ketika menjalankan docker container
# CMD / Command, tdk akan dijalankan ketika proses build, melainkan dijalankan ketika docker container berjalan
CMD ["node", "app.js"]