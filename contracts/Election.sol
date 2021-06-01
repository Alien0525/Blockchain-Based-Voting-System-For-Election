// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.5.0;

contract Election {

    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    constructor () public {
        addCandidate("Bharatiya Janata Party (BJP)");
        addCandidate("Indian National Congress (INC)");
        addCandidate("All India Trinamool Congress (TMC)");
    }

    mapping(uint => Candidate) public candidates ;

    uint public candidatesCount;
    
    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }


}
