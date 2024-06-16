# Utilisez une image Node.js 20 comme image de base
FROM node:20.11.1
# Définir le répertoire de travail
WORKDIR /app
# Copier le fichier package.json et package-lock.json
COPY package*.json ./
# Installer les dépendances
RUN npm install
# Copier tout le contenu du projet dans le conteneur
COPY . .
# Générer les fichiers Prisma pour les cibles binaires spécifiées
RUN npx prisma generate
# Exposer le port sur lequel l'API va tourner
EXPOSE 5000
# Démarrer l'API
CMD ["npm", "start"]
