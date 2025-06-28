import tseslint from "typescript-eslint";
import eslint from "@eslint/js";

export default tseslint.config([
  // {
  //   files: ["**/*.{js,mjs,cjs,ts,mts,cts}"],
  //   plugins: { js },
  //   extends: ["js/recommended"],
  // },
  // {
  //   files: ["**/*.{js,mjs,cjs,ts,mts,cts}"],
  //   languageOptions: { globals: globals.node },
  // },
  eslint.configs.recommended,
  tseslint.configs.recommended,
]);
