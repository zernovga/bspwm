import pathlib
import os

print("Start seting up...")

PATH = pathlib.Path().resolve()
HOME = pathlib.Path().home()


for dir, subdirs, files in os.walk(PATH / "config"):
    rel_path = pathlib.Path(dir).relative_to(PATH / "config")
    print(f"Copy {rel_path}")
    os.makedirs(
        HOME / ".config" / pathlib.Path(dir).relative_to(PATH / "config"), exist_ok=True
    )
    for file in files:
        if (HOME / ".config" / pathlib.Path(dir).relative_to(PATH / "config") / file).exists():
            os.remove(HOME / ".config" / pathlib.Path(dir).relative_to(PATH / "config") / file)
        os.link(
            dir + "/" + file,
            HOME / ".config" / pathlib.Path(dir).relative_to(PATH / "config") / file,
        )
if (HOME / ".xinitrc").exists():
    os.remove(HOME / ".xinitrc")
        
os.link(PATH / ".xinitrc",HOME / ".xinitrc",)
if (HOME / ".Xresources").exists():
    os.remove(HOME / ".Xresources")
os.link(PATH / ".Xresources", HOME / ".Xresources")
