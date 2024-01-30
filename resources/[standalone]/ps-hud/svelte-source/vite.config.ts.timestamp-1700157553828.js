// vite.config.ts
import { defineConfig } from "vite";
import { svelte } from "@sveltejs/vite-plugin-svelte";
import WindiCSS from "vite-plugin-windicss";
import { minify } from "html-minifier";
import "vite-plugin-compression";
var minifyHtml = () => {
  return {
    name: "html-transform",
    transformIndexHtml(html) {
      return minify(html, {
        collapseWhitespace: true
      });
    }
  };
};
var vite_config_default = defineConfig(({ mode }) => {
  const isProduction = mode === "production";
  return {
    plugins: [
      WindiCSS(),
      svelte(),
      isProduction && minifyHtml()
    ],
    base: "./",
    build: {
      minify: isProduction,
      emptyOutDir: true,
      outDir: "../html",
      assetsDir: "./",
      rollupOptions: {
        output: {
          entryFileNames: `[name].js`,
          chunkFileNames: `[name].js`,
          assetFileNames: `[name].[ext]`
        }
      }
    }
  };
});
export {
  vite_config_default as default
};
//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAic291cmNlcyI6IFsidml0ZS5jb25maWcudHMiXSwKICAic291cmNlc0NvbnRlbnQiOiBbImltcG9ydCB7IGRlZmluZUNvbmZpZyB9IGZyb20gJ3ZpdGUnXG5pbXBvcnQgeyBzdmVsdGUgfSBmcm9tICdAc3ZlbHRlanMvdml0ZS1wbHVnaW4tc3ZlbHRlJ1xuaW1wb3J0IFdpbmRpQ1NTIGZyb20gJ3ZpdGUtcGx1Z2luLXdpbmRpY3NzJ1xuaW1wb3J0IHsgbWluaWZ5IH0gZnJvbSBcImh0bWwtbWluaWZpZXJcIjtcbmltcG9ydCB2aXRlQ29tcHJlc3Npb24gZnJvbSAndml0ZS1wbHVnaW4tY29tcHJlc3Npb24nO1xuXG5jb25zdCBtaW5pZnlIdG1sID0gKCkgPT4ge1xuICByZXR1cm4ge1xuICAgIG5hbWU6ICdodG1sLXRyYW5zZm9ybScsXG4gICAgdHJhbnNmb3JtSW5kZXhIdG1sKGh0bWwpIHtcbiAgICAgIHJldHVybiBtaW5pZnkoaHRtbCwge1xuICAgICAgICBjb2xsYXBzZVdoaXRlc3BhY2U6IHRydWUsXG4gICAgICB9KTtcbiAgICB9LFxuICB9O1xufTtcblxuXG5leHBvcnQgZGVmYXVsdCBkZWZpbmVDb25maWcoKHsgbW9kZSB9KSA9PiB7XG4gIGNvbnN0IGlzUHJvZHVjdGlvbiA9IG1vZGUgPT09ICdwcm9kdWN0aW9uJztcblxuICByZXR1cm4ge1xuICAgIHBsdWdpbnM6IFtXaW5kaUNTUygpLCBzdmVsdGUoKSxcbiAgICAgIGlzUHJvZHVjdGlvbiAmJiBtaW5pZnlIdG1sKCksXG4gICAgICAvLyBpc1Byb2R1Y3Rpb24gJiYgdml0ZUNvbXByZXNzaW9uKHthbGdvcml0aG06IFwiYnJvdGxpQ29tcHJlc3NcIiwgZXh0OlwiLmJ6XCJ9KVxuICAgIF0sXG4gICAgYmFzZTogJy4vJywgLy8gZml2ZW0gbnVpIG5lZWRzIHRvIGhhdmUgbG9jYWwgZGlyIHJlZmVyZW5jZSwgd2h5IGdvZCB3aHlcbiAgICBidWlsZDoge1xuICAgICAgbWluaWZ5OiBpc1Byb2R1Y3Rpb24sXG4gICAgICBlbXB0eU91dERpcjogdHJ1ZSxcbiAgICAgIG91dERpcjogJy4uL2h0bWwnLFxuICAgICAgYXNzZXRzRGlyOiAnLi8nLFxuICAgICAgcm9sbHVwT3B0aW9uczoge1xuICAgICAgICBvdXRwdXQ6IHtcbiAgICAgICAgICAvLyBCeSBub3QgaGF2aW5nIGhhc2hlcyBpbiB0aGUgbmFtZSwgeW91IGRvbid0IGhhdmUgdG8gdXBkYXRlIHRoZSBtYW5pZmVzdCwgeWF5IVxuICAgICAgICAgIGVudHJ5RmlsZU5hbWVzOiBgW25hbWVdLmpzYCxcbiAgICAgICAgICBjaHVua0ZpbGVOYW1lczogYFtuYW1lXS5qc2AsXG4gICAgICAgICAgYXNzZXRGaWxlTmFtZXM6IGBbbmFtZV0uW2V4dF1gXG4gICAgICAgIH1cbiAgICAgIH1cbiAgICB9LFxuICB9O1xufSk7Il0sCiAgIm1hcHBpbmdzIjogIjtBQUFBLFNBQVMsb0JBQW9CO0FBQzdCLFNBQVMsY0FBYztBQUN2QixPQUFPLGNBQWM7QUFDckIsU0FBUyxjQUFjO0FBQ3ZCLE9BQTRCO0FBRTVCLElBQU0sYUFBYSxNQUFNO0FBQ3ZCLFNBQU87QUFBQSxJQUNMLE1BQU07QUFBQSxJQUNOLG1CQUFtQixNQUFNO0FBQ3ZCLGFBQU8sT0FBTyxNQUFNO0FBQUEsUUFDbEIsb0JBQW9CO0FBQUEsTUFDdEIsQ0FBQztBQUFBLElBQ0g7QUFBQSxFQUNGO0FBQ0Y7QUFHQSxJQUFPLHNCQUFRLGFBQWEsQ0FBQyxFQUFFLEtBQUssTUFBTTtBQUN4QyxRQUFNLGVBQWUsU0FBUztBQUU5QixTQUFPO0FBQUEsSUFDTCxTQUFTO0FBQUEsTUFBQyxTQUFTO0FBQUEsTUFBRyxPQUFPO0FBQUEsTUFDM0IsZ0JBQWdCLFdBQVc7QUFBQSxJQUU3QjtBQUFBLElBQ0EsTUFBTTtBQUFBLElBQ04sT0FBTztBQUFBLE1BQ0wsUUFBUTtBQUFBLE1BQ1IsYUFBYTtBQUFBLE1BQ2IsUUFBUTtBQUFBLE1BQ1IsV0FBVztBQUFBLE1BQ1gsZUFBZTtBQUFBLFFBQ2IsUUFBUTtBQUFBLFVBRU4sZ0JBQWdCO0FBQUEsVUFDaEIsZ0JBQWdCO0FBQUEsVUFDaEIsZ0JBQWdCO0FBQUEsUUFDbEI7QUFBQSxNQUNGO0FBQUEsSUFDRjtBQUFBLEVBQ0Y7QUFDRixDQUFDOyIsCiAgIm5hbWVzIjogW10KfQo=
