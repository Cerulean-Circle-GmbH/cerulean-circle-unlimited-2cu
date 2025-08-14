# WODA - File Structure and ONCE basic use.

Here you can watch a [workshop video](http://wo-da.de/RAW/2cuDevVideos/200603_11:14_Sprint-3_Integration_Bootstrap.mp4) about that.

### What is WODA?

WODA, is a web platform that builds web just via drag and drop.

If you are here and want to understand the code structure of WODA and how WODA works. So, I’m assuming you already setup WODA in your work-station. For more setup help check below Prerequisite.

### Prerequisite:-

- Bash basic understanding
- [EAMD installation](https://2cu.atlassian.net/wiki/spaces/CCU/pages/38436869/ONCE+Documentation#Getting-Started-Overview)
- [Woda installation](https://2cu.atlassian.net/wiki/spaces/CCU/pages/38436869/ONCE+Documentation#start-with-a-naked-bash)
- Open EAMD “Components“ folder in your IDE. (project root is Components)

### Woda File Tree in Code:-

Woda1.0 file structure location  
`http://localhost:8080/woda`  
`/Components/com/ceruleanCircle/EAM/5_ux/WODA/1.0.0/src/html/WODA.html`  
  
Woda2.0 file structure location  
`/Components/com/ceruleanCircle/EAM/5_ux/WODA/2.0.0-ONE/src/html/WODA.html`  
  
Open components.xml in browser  
`http://localhost:8080/EAMD.ucp` <Find your file loction>

### Woda ONCE Tree in Code:-

Woda ONCE, gives you a blank page to check your component via drag & drop. Further, you include the ONCE component in your custom component to auto-load development (explain in “component creation doc“).

Woda ONCE 1.0  
`/Components/tla/EAM/layer1/Thinglish/Once/1.0.0/src/html/Once.html`

Woda ONCE 2.0  
`/Components/tla/EAM/layer1/Thinglish/Once/2.0.0-ONE/src/html/Once.html`

defaultWorkspace....: /var/dev/EAMD.ucp/Components