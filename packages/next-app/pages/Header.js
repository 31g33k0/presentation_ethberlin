import Head from "next/head";

function Header() {
  return (
    <Head>
      <title>HyperCertain Funding</title>
      <meta
        name="description"
        content="Fund impact, track the money, get the facts!"
      />
      <link rel="icon" href="/unicorn.png" /> //TODOChange
      <meta property="og:title" content="🦄 Web3 Starter Kit" />
      <meta property="og:type" content="website" />
      <meta property="og:url" content="//TODOChange" />
      <meta property="og:site_name" content=" HyperCertain"></meta>
      <meta
        property="og:description"
        content="Fund impact, track the money, get the facts!"
      />
    
    </Head>
  );
}

export default Header;
