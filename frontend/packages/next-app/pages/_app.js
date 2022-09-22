import "../styles/globals.css";
import "@rainbow-me/rainbowkit/styles.css";

import { RainbowKitProvider } from "@rainbow-me/rainbowkit";
import { WagmiConfig } from "wagmi";
import { wagmiClient, chains } from "../helpers/rainbowSetup";

function MyApp({ Component, pageProps }) {
  const appInfo = {
    appName: "HyperCertain Funding",
  };

  return (
    <WagmiConfig client={wagmiClient}>
      <RainbowKitProvider
        showRecentTransactions={true}
        coolMode
        appInfo={appInfo}
        chains={chains}
      >
        
          <Component {...pageProps} />
        
      </RainbowKitProvider>
    </WagmiConfig>
  );
}

export default MyApp;
