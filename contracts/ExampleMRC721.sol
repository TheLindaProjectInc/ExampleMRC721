// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract ExampleMRC721 is ERC721, ERC721Enumerable {
    bytes4 private constant MINT_ID =
        bytes4(keccak256("mintUniqueTokenTo(address,uint256)"));

    constructor() ERC721("Example MRC721", "XMPL") {}

    /**
     * @dev See {ERC721-_beforeTokenTransfer}.
     */
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual override(ERC721, ERC721Enumerable) {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return interfaceId == MINT_ID || super.supportsInterface(interfaceId);
    }

    /**
     * @dev See {ERC721-_baseURI}.
     */
    function _baseURI() internal pure override returns (string memory) {
        return "example#";
    }

    /**
     * Custom accessor to create a unique token
     */
    function mintUniqueTokenTo(address _to, uint256 _tokenId) public {
        super._mint(_to, _tokenId);
    }
}
