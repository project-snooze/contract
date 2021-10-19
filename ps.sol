contract PS is ERC721URIStorage {
    uint8 public counter=0;
    address payable[] public team;
    uint256[] public shares;
    uint256 basePrice=1000000000000000;
    mapping(uint16=>string) oi;
       constructor(address payable[] memory bosiiLaBani, uint256[] memory procente)ERC721("Project Snooze", "SHP") {
        team=bosiiLaBani;
        shares=procente;
       }
    
       
    function dividends()public payable{
        uint256 total = address(this).balance;
        for (uint256 i = 0; i < team.length; i++) {
            team[i].transfer((total * (shares[i] * 100)) / 10000);
        }
    }
    
    
    function createToken(string memory tokenURI) public payable returns (uint) {
        require(counter<7778, "No more");
        if (counter>7){
            require(msg.value>=basePrice,"Minimum token price is 0.07777 ETH.");
        }
        counter+=1;
        _mint(msg.sender, counter);
        _setTokenURI(counter, tokenURI);
        return counter;
    }
}
