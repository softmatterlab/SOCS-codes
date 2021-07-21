function [ new_m ] = rule_gameoflife( m, m_nb )
%RULE_GAMEOFLIFE Summary of this function goes here
%   Detailed explanation goes here

new_m = 0*m;

% idead = find(uint8(m_nb)==uint8(1));
% idead = find(uint8(m_nb)==uint8(4));
% idead = find(uint8(m_nb)==uint8(5));
% idead = find(uint8(m_nb)==uint8(6));
% idead = find(uint8(m_nb)==uint8(7));
% idead = find(uint8(m_nb)==uint8(8));

isame = find(uint8(m_nb)==uint8(2));

inew = find(uint8(m_nb)==uint8(3));

new_m(isame) = m(isame);
new_m(inew) = 1;


end

