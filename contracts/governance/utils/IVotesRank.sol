// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.5.0) (governance/utils/IVotesRanks.sol)
pragma solidity ^0.8.0;

/**
 * @dev Common interface for {ERC20VotesRank}, {ERC721VotesRank}, and other {Votes}-enabled contracts.
 *
 * _Available since v4.5._
 */
interface IVotesRank {
    /**
     * @dev Emitted when an account changes their delegates.
     */
    event DelegatesChanged(address indexed delegator, address[] indexed fromDelegates, address[] indexed toDelegates);

    /**
     * @dev Emitted when a token transfer or delegate change results in changes to a delegate's number of votes.
     */
    event DelegatesVotesChanged(address[] indexed delegates, uint256 previousBalance, uint256 newBalance);

    /**
     * @dev Returns the current amount of votes that `account` has.
     */
    function getVotes(address account) external view returns (uint256);

    /**
     * @dev Returns the amount of votes that `account` had at the end of a past block (`blockNumber`).
     */
    function getPastVotes(address account, uint256 blockNumber) external view returns (uint256);

    /**
     * @dev Returns the total supply of votes available at the end of a past block (`blockNumber`).
     *
     * NOTE: This value is the sum of all available votes, which is not necessarily the sum of all delegated votes.
     * Votes that have not been delegated are still part of total supply, even though they would not participate in a
     * vote.
     */
    function getPastTotalSupply(uint256 blockNumber) external view returns (uint256);

    /**
     * @dev Returns the delegates that `account` has chosen.
     */
    function delegates(address account) external view returns (address[] memory);

    /**
     * @dev Delegates votes from the sender to `delegatees`.
     */
    function delegate(address[] calldata) external;

    /**
     * @dev Delegates votes from signer to `delegatees`.
     */
    function delegateBySig(
        address[] calldata,
        uint256 nonce,
        uint256 expiry,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;
}
