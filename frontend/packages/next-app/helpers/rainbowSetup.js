import { chain, createClient, configureChains } from "wagmi";
import { getDefaultWallets } from "@rainbow-me/rainbowkit";
import { alchemyProvider } from "wagmi/providers/alchemy";
import { publicProvider } from "wagmi/providers/public";

export const { chains, provider } = configureChains(
  [
    chain.goerli,
    chain.mainnet,
    chain.polygonMumbai,
    chain.polygon,
    chain.hardhat,
  ],
  [alchemyProvider({ alchemyId: process.env.ALCHEMY_ID }), publicProvider()]
);
const { connectors } = getDefaultWallets({
  appName: "HyperCertain",
  chains,
});
export const wagmiClient = createClient({
  // autoConnect: true,
  connectors,
  provider,
});
