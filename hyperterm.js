module.exports = {

  config: {
    fontSize: 16,
    fontFamily: 'Fira Code',
    cursorShape: 'BEAM',
    windowSize: [720, 610],
    foregroundColor: '#e0e3ed',
    backgroundColor: '#292936',
    borderColor: '#1D1E22',
    css: `
      .tabs_nav {
        background-color: #21212b;
      }

      .tabs_list {
        border-color: rgba(255, 255, 255, .04) !important;
      }

      .tab_active {
        border-bottom: 0 !important;
      }

      .tab_textActive {
        background-color: #292936;
        border-right: 1px solid rgba(255, 255, 255, .04);
        border-left: 1px solid rgba(255, 255, 255, .04);
      }
    `
  }
};
