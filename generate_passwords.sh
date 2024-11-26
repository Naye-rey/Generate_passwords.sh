#!/bin/bash

echo -e "\e[35m
╭━━━╮
┃╭━╮┃
┃┃╱╰╋━━┳━╮
┃┃╭━┫┃━┫╭╮╮
┃╰┻━┃┃━┫┃┃┃
╰━━━┻━━┻╯╰╯
╭━━━╮╱╱╱╱╱╭╮
┃╭━╮┃╱╱╱╱╭╯╰╮
┃┃╱╰╋━━┳━╋╮╭╋━┳━━┳━━┳━━┳━╮╭━━┳━━╮
┃┃╱╭┫╭╮┃╭╮┫┃┃╭┫╭╮┃━━┫┃━┫╭╮┫╭╮┃━━┫
┃╰━╯┃╰╯┃┃┃┃╰┫┃┃╭╮┣━━┃┃━┫┃┃┃╭╮┣━━┃
╰━━━┻━━┻╯╰┻━┻╯╰╯╰┻━━┻━━┻╯╰┻╯╰┻━━╯\e[0m"

echo -e "\e[36mGENERADOR DE CONTRASEÑAS\e[0m"

# Verifica si el directorio de destino existe, si no lo crea
output_dir="/sdcard/secure_passwords"
if [ ! -d "$output_dir" ]; then
    mkdir "$output_dir"
fi

# Función para generar una contraseña segura
generate_password() {
    local password_length=16
    local charset="A-Z a-z 0-9 ÁÉÍÓÚáéíóú !@#\$%^&*()_+{}[]|;:,.<>?"
    password=$(tr -dc "$charset" < /dev/urandom | head -c$password_length)
    echo "$password"
}

# Pide al usuario cuántas contraseñas quiere generar
read -p "¿Cuántas contraseñas desea generar? " num_passwords

# Genera y guarda las contraseñas
for i in $(seq 1 $num_passwords); do
    password=$(generate_password)
    echo "Contraseña $i: $password" >> "$output_dir/secure_passwords.txt"
done

echo "Las contraseñas seguras se han guardado en $output_dir/secure_passwords.txt"