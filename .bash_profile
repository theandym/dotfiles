# Load ~/.path, ~/.prompt, ~/.variables, ~/.aliases, ~/.functions, and
# ~/.custom. Use ~/.custom for system-specific settings you don’t want to
# commit.

for file in ~/.{path,prompt,variables,aliases,functions,custom}; do
  [ -r "$file" ] && source "$file"
done

unset file

#####

# Credits:
# https://github.com/janmoesen/tilde/blob/master/.bash_profile
