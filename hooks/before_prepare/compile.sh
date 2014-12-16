# Compiles CoffeeScript and Sass
# Make sure to have the folowing Structure
# src
#   - coffee
#   - sass
# www
#   - js
#   - css
#
# unless you used cinit.sh

# Use this to minify all the js into one file (main.js) with
# the given array order
javascripts=(index)

coffee -c -o www/resources/js/ src/resources/coffee/*.coffee
coffee -c -o src/tests/spec/js src/tests/spec/coffee/*.coffee
rm www/resources/js/main.js
for scripts in "${javascripts[@]}"; do
  echo "$scripts added to main.js";
  cat www/resources/js/$scripts.js >> www/resources/js/main.js
  # rm www/resources/js/$scripts.js
done

compass compile
for filename in src/haml/*.haml; do
  file=${filename##*/}
  basename=${file%.haml}
  haml src/haml/$file www/$basename.html
done
rm -r www/vendors
cp -r src/vendors www/
