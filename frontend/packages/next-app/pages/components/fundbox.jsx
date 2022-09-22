import React from "react";
import { useState } from "react";
import { ethers } from "ethers";
import Web3 from "web3";
import { Flex, textDecoration } from "@chakra-ui/react";
import { Signer } from "ethers";
import { provider } from "../../helpers/rainbowSetup";
import { useEffect } from "react";
import { BigNumber } from "ethers";
import  MyContrABI from  "./ABIContract.json"



function FundBox({ initialId, onSave }) {
  const contract = "0xD8411c1Bba3a414B421efc8195A72f0033AA59fB"
  const { ethers } = require("ethers");
  const [newId, setNewId] = useState(initialId)

  useEffect(() => {


    console.log("ji")










  


  }, [])


  const Sendtx = async () => {
    const provider = new ethers.providers.Web3Provider(window.ethereum)
    const signer = provider.getSigner()
    let gaslimit = 281918885;
    let cost = ethers.utils.parseEther(newId)
  
    const initcontr = new ethers.Contract(contract, MyContrABI,signer)
    await initcontr.buyCert({
      value: cost,
      gasLimit : gaslimit
    ,
     })
  
   }


  return (
    <>
      <Flex className={"diamond-yellow"} px={"4em"} py={"1.5em"} justifyContent={"flex-mid"}>
    
    
   
      </Flex>


      <li>
      <input 
        type="any" 
        placeholder="5" 
        onChange={(e) => setNewId(e.target.value)} 
      />
      <button onClick={() => Sendtx()}>Fund Impact</button> 
    </li>

      
     
    </>
  );
}

export default FundBox ;  
