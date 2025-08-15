[📁 Learning Documentation And Videos GitHub](/cerulean-circle-unlimited-2cu/product/development/learning-documentation-and-videos.md) | [🌐 Index Structure GitHub](/cerulean-circle-unlimited-2cu/product/development/learning-documentation-and-videos/install-plantuml.md) | [🌐 Index Structure local SymLink](./install-plantuml.entry.md)

# Install PlantUML

- [Install and start PlantUML server](#install-and-start-plantuml-server)
- [Configure VSCode to be PlantUML compatible](#configure-vscode-to-be-plantuml-compatible)

## Install and start PlantUML server

1. Checkout the EAMD.ucp repository [https://bitbucket.org/donges/eamd.ucp/](https://bitbucket.org/donges/eamd.ucp/)
2. Navigate to `/Components/com/ceruleanCircle/EAM/1_infrastructure/DockerWorkspaces/plantuml/`
3. Build and start docker image as described in `README.md` file
4. Your PlantUML server should run at [http://localhost:8082/](http://localhost:8082/)

## Configure VSCode to be PlantUML compatible

1. Install the PlantUML Extension![](./attachments/image-20200730-152417.png)
2. Configure the PlantUML extension to use our local PlantUML server![](./attachments/image-20200730-152548.png)
3. Open a .puml file and right click into it to preview or export it to various formats![](./attachments/image-20200730-152742.png)
4. To export diagram in same folder beside puml file
```
Replace this code File -> Preferances -> Setting -> Extensions -> PlantUML Configuration -> Edit in settings.json
{
    "atomKeymap.promptV3Features": true,
    "editor.multiCursorModifier": "ctrlCmd",
    "editor.formatOnPaste": true,
    "window.zoomLevel": -1,
}
With 
{
    "atomKeymap.promptV3Features": true,
    "editor.multiCursorModifier": "ctrlCmd",
    "editor.formatOnPaste": true,
    "window.zoomLevel": -1,
    "plantuml.exportOutDirName": ".",
    "plantuml.exportSubFolder": false,
    "plantuml.diagramsRoot": ".",
    "plantuml.exportOutDir": "."
}
```
5. Enjoy your diagrams 🍻![](./attachments/image-20200730-152903.png)
