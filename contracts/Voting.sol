pragma solidity ^0.4.23; //We have to specify what version of compiler this code will use

import "./ERC20.sol";

contract Voting {
  /* mapping is equivalent to an associate array or hash
  The key of the mapping is candidate name stored as type bytes32 and value is
  an unsigned integer which used to store the vote count
  */
  mapping (bytes32 => uint256) public votesReceived;
  
  /* Solidity doesn't let you create an array of strings yet. We will use an array of bytes32 instead to store
  the list of candidates
  */
  
  address lrcAddress = 0xef68e7c694f40c8202821edf525de3782458639f;

  bytes32[] public candidateList;

  // Initialize all the contestants
  function Voting(bytes32[] candidateNames) {
    candidateList = candidateNames;
  }

  function totalVotesFor(bytes32 candidate) returns (uint256) {
    require(validCandidate(candidate));
    return votesReceived[candidate];
  }

  function voteForCandidate(bytes32 candidate) {
    require(validCandidate(candidate));
    //TODO: get the specific token balance
    uint256 balance = ERC20(lrcAddress).balanceOf(msg.sender);
    votesReceived[candidate] += balance;
  }

  function validCandidate(bytes32 candidate) returns (bool) {
    for(uint i = 0; i < candidateList.length; i++) {
      if (candidateList[i] == candidate) {
        return true;
      }
    }
    return false;
  }

  // This function returns the list of candidates.
  function getCandidateList() constant returns (bytes32[]) {
    return candidateList;
  }
}
