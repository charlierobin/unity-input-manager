# Unity Input Manager Helper 
## A file editor for Unity Input Manager Assets

I’ve always found editing the input axes for games in Unity to be about as pleasant as having teeth pulled, just minus the charming company of the dentist and her equally charming assistant.

So over the years I’ve slowly put together an editing app of my own. It started in (roughly) 2015 I think, and has had the odd bit added here and there, plus (of course) the mistakes and other bugs fixed.

I know that these days we’re supposed to use the new Unity input system, but, good though it is, a lot of the time it’s just too involved for the kind of games I tend to produce. So although by now I always thought that I would have ditched the old input system for the new one, it just hasn’t happened that way: I keep coming back to the old ways.

There are still things here and there that I always wanted to add but never got around to: a window displaying the “history” of deleted axes, a folder in `Documents` in which any Asset documents are automatically opened on launch, drag and drop between different settings files (at the moment it’s copy and paste only). Also generalising the reading and writing of YAML files, rather than the bodge it is at the moment. (Although given the format and layout of the input manager assets hasn’t changed since whenever, it’s a bodge that has stood the test of time.) And a window menu was always on the list of “things to do”. Along with undoing changes to a setting.

But even as it is, I still find it to be a very useful app, so perhaps others will feel the same way.

You can have as many input manager asset files open as you like, and copy/paste axes between them:

![three-windows-and-templates-window](https://github.com/user-attachments/assets/66b0041c-eac6-47b2-9f98-518fa1b29ff4)

I went through a lot of the Unity template projects and collected all their default input manager files, making them available for browsing:

![templates-popup](https://github.com/user-attachments/assets/37253609-554f-40fb-ba88-258e6cbc6439)

... and making it easy to select the required settings in them and quickly create a new input manager asset from them:

![creating-new-asset-using-some-axes-from-template](https://github.com/user-attachments/assets/ec706159-6584-444f-ae76-a4f74d3b7e3b)

In the narrower windows you get a summary view of an axis’ settings, with a wider window you get a more detailed breakdown of every setting (similar to the actual view in Unity itself):

![detailed-view-wide](https://github.com/user-attachments/assets/3aecc26e-48f7-43b9-9a4c-bde0de5d3af2)

There’s a simple floating editing window:

![edit-window](https://github.com/user-attachments/assets/7263e34d-284b-44ad-90ae-188bb7d08be6)

There’s a popup of common key names/joystick axes/controller buttons etc for help when editing:

![axes-popup-menu](https://github.com/user-attachments/assets/a0dd9b18-47fa-4fd5-8eb6-1b45eda01303)

(These popups were never finished, so I think there are a few keys/buttons/axes missing, but I’ve never got around to cross-referencing with the official Unity documentation and building a comprehensive list.)

So, in conclusion, perhaps others will find this app as useful as I’ve found it over the years.

Source code is in [xojo-project-files](/xojo-project-files), for those happy to take the risk downloading pre-built binaries, here they are:

Download links below for a zip of Intel, ARM and universal versions, and a zip of a disk image of Intel, ARM and universal versions. (All macOS, as already mentioned somewhere above, I think. But the last time I quickly went through the codebase I couldn’t see anything obvious that would stop it from being pretty quickly setup to run on Windows or Linux. But I’m a Mac user, so that’s where my prioritiesd tend to congregate.)

[zip of Intel, ARM and universal versions](https://www.dropbox.com/scl/fi/anw470px54ocj6tu36b9l/UnityInputManagerHelper.zip?rlkey=v3glmsai513tst4cexcf6rd0j&st=59k7g92r&dl=1)

[zip of a disk image of Intel, ARM and universal versions](https://www.dropbox.com/scl/fi/s33f4w8l7zgsa8h9ombn2/UnityInputManagerHelper.dmg.zip?rlkey=dtf27q0enuamswxuxdaaour03&st=b10jxqxk&dl=1)
