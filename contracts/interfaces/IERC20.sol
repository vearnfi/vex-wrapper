// SPDX-License-Identifier: MIT
pragma solidity ^0.4.23;

// Abstract contract for the full ERC 20 Token standard
interface IERC20 {
    /* This is a slight change to the ERC20 base standard.
    function totalSupply() constant returns (uint256 supply);
    is replaced with:
    uint256 external totalSupply;
    This automatically creates a getter function for the totalSupply.
    This is moved to the base contract since external getter functions are not
    currently recognised as an implementation of the matching abstract
    function by the compiler.
    */
    /// total amount of tokens
    //uint256 external totalSupply;
    function totalSupply() external returns (uint256 supply);

    // @param _owner The address from which the balance will be retrieved
    // @return The balance
    function balanceOf(address _owner) external returns (uint256 balance);

    // @notice send `_value` token to `_to` from `msg.sender`
    // @param _to The address of the recipient
    // @param _value The amount of token to be transferred
    // @return Whether the transfer was successful or not
    function transfer(address _to, uint256 _value) external returns (bool success);

    // @notice send `_value` token to `_to` from `_from` on the condition it is approved by `_from`
    // @param _from The address of the sender
    // @param _to The address of the recipient
    // @param _value The amount of token to be transferred
    // @return Whether the transfer was successful or not
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool success);

    // @notice `msg.sender` approves `_addr` to spend `_value` tokens
    // @param _spender The address of the account able to transfer the tokens
    // @param _value The amount of wei to be approved for transfer
    // @return Whether the approval was successful or not
    function approve(address _spender, uint256 _value) external returns (bool success);

    // @param _owner The address of the account owning tokens
    // @param _spender The address of the account able to transfer the tokens
    // @return Amount of remaining tokens allowed to spent
    function allowance(address _owner, address _spender) external returns (uint256 remaining);

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}
