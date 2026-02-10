# გამოვიყენოთ nginx:alpine როგორც საბაზო სურათი
FROM nginx:alpine

# დავაკოპიროთ ჩვენი index.html nginx-ის სტანდარტულ დირექტორიაში
COPY index.html /usr/share/nginx/html/index.html

# გავხსნათ 80-ე პორტი
EXPOSE 80

# nginx-ი ავტომატურად გაეშვება, ამიტომ არ არის საჭირო CMD ინსტრუქცია
