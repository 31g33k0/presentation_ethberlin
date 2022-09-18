import { Heading, Container, Text, Flex, Link, Code } from "@chakra-ui/react";
import React from "react";

function Hero() {
  return (
    <>
      <Container maxW={"1100px"} h={"39vh"} px={"2rem"}>
        <Flex
          flexDirection={"column"}
          alignItems={"center"}
          justifyContent={"center"}
          h={"100%"}
          w={"100%"}
          py={"4rem"}
        >
          <Flex justifyContent={"center"} alignItems={"center"}>
         
         
              <Heading className="title"
              
                fontWeight={"700"}
                fontSize={["1.4rem", "1rem", "2.5rem", "3rem", "4rem"]}
              >
                Hypercertain
              </Heading>
            <Text 
            textAlign={"center"}
            textColor={"white"}
            mt={"4rem"}
            fontSize={["1rem", "1rem", "1.2rem", "1.4rem", "1.6rem"]}
          >
           Fund impact, track the money, get the facts
          
          </Text>
          </Flex>

         
        </Flex>
      </Container>
    </>
  );
}

export default Hero;
