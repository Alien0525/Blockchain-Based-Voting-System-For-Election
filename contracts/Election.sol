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
        addCandidate("None Of The Above (NOTA)");
    }

    mapping(uint => Candidate) public candidates ;

    uint public candidatesCount;

    // Store accounts that have voted
    mapping(address => bool) public voters;
    
    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote (uint _candidateId) public {
        // require that they haven't voted before
        // makes sure voters vote only once
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount++;
    }


}
