# Keymaps

In this repository I store my configuration for my custom keyboard layout for
different systems.

# Linux

Coming soon...

# Mac

On mac I created my keylayout file with
(Ukulele)[https://github.com/sillsdev/Ukelele] I saved the project to this repo.
It is sufficient to copy the keylayout file into `~/Library/Keyboard Layouts/`,
then reboot, and configure the keyboard in the system config.

# Windows

NOTE: _The best way would be to use Microsoft Keyboard Layout Creator (MSKLC),
or PowerToys, but so far I only had machines that I did not have admin rights
to, so I had to work around those much better tools. I use a program that can
run only in user space._

This program is AutoHotkey, which is a wierd scripting language, that spawns a
background process and intercepts keyboard events. It is a hacky workaround.

The program has to be downloaded from
(https://github.com/AutoHotkey/AutoHotkey/releases/tag/v1.1.37.02)[https://github.com/AutoHotkey/AutoHotkey/releases/tag/v1.1.37.02]
and then the script in this repo (`autohotkey.ahk`) must be compiled. The
compilation creates the final EXE that has to be launched by the user.
