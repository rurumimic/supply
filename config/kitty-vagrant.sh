vsh() {

  if [ ! -f Vagrantfile ]; then
    echo -e "\e[31mThere is no 'Vagrantfile' here.\e[0m" >&2
    return 1
  fi

  if [ ! -d .vagrant ]; then
    echo -e "\e[31mThere is no '.vagrant/' here.\e[0m" >&2
    return 1
  fi

  if [ ! -f .vagrant/ssh-config ]; then
    vagrant ssh-config > .vagrant/ssh-config
  fi

  kitty +kitten ssh -F .vagrant/ssh-config "${1:-default}"

}

