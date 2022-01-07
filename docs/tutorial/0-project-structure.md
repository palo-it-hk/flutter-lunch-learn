---
sidebar_position: 2
---

# Step 0 - Project Structure

Once you open the project in the editor of your choice, you should see a similar view like this in the toolbar, in the left side of the screen:

![Project Structure](/img/docs/0-project-structure/project-structure.png)

It may look overwhelming at first, and is true that a Flutter developer will often need to tamper with many of these files and folders.
Fortunately in this project, most of the heavy lifting has been done for you, and we **only need to focus in the files under `/lib`**

## Files under `/lib`

This is the main project folder, and is the folder we will be focusing throughout the tutorial.

:::tip
Think of it as **the baseplate** we will be building our newly bought lego set on.
:::

![lib](/img/docs/0-project-structure/lib.png)

- `pages/` folder - Contains pages (or screens) of the app. We will only have 1 screen called `home`
- `widgets/` folfer - Contains customized widgets used in the app, corresponding to [widgets shown in the design overview](./app-overview.md#design). More on what are widgets later.
- `main.dart` - The entry point of the app. This has been set up properly and we do not need to worry about it.
- `theme.dart` - The themeing of the app. This has been set up properly. You can take a peek and compare the content with the [Design system inside the Figma design file](https://www.figma.com/file/oTfK4t50rfSdkTwjLRauvn/?node-id=93%3A313).