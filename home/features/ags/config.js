const colors = {
  base: "#1c1c21",
  
}


const background = Widget.Box({
  css: `background-color: ${colors.base}`
  
})

const bar = Widget.Window({
  name: "bar",
  anchor: ["top", "left", "right"],
  exclusivity: "exclusive",
  width_request: 1920,
  height_request: 36,
  child: background,
})

App.config({
  windows: [bar],
  style: "./style.css",
  
})
