import Header from "./Header";
import React, { useEffect } from "react";
import Hero from "./components/Hero";
import Navbar from "./components/Navbar";
import Footer from "./components/Footer";
import { useToast } from "@chakra-ui/react";
import FundBox from "./components/fundbox";
import ImpactBox from "./components/impactbox";

export default function Home() {
  const toast = useToast();

  useEffect(() => {
    toast({
      title: "Connect Wallet",
      description: "connect to Görli for testing",
      status: "info",
      duration: 4000,
      isClosable: false,
      position: "bottom-right",

    });
  }, []);
  return (
    <>
      <Header />
      <Navbar />
       
      <Hero />
     
      <FundBox />
    </>
  );
}
