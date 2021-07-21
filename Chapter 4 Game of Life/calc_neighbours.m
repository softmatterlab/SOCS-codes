function [ m_nb ] = calc_neighbours( m, bc )
%CALC_NEIGHBOURS Summary of this function goes here
%   Detailed explanation goes here

[Ny, Nx] = size(m);

m_N = zeros(Ny,Nx);
m_N(2:Ny,:) = m(1:Ny-1,:);

m_S = zeros(Ny,Nx);
m_S(1:Ny-1,:) = m(2:Ny,:);

m_E = zeros(Ny,Nx);
m_E(:,1:Nx-1) = m(:,2:Nx);

m_W = zeros(Ny,Nx);
m_W(:,2:Nx) = m(:,1:Nx-1);

m_NE = zeros(Ny,Nx);
m_NE(2:Ny,1:Nx-1) = m(1:Ny-1,2:Nx);

m_NW = zeros(Ny,Nx);
m_NW(2:Ny,2:Nx) = m(1:Ny-1,1:Nx-1);

m_SE = zeros(Ny,Nx);
m_SE(1:Ny-1,1:Nx-1) = m(2:Ny,2:Nx);

m_SW = zeros(Ny,Nx);
m_SW(1:Ny-1,2:Nx) = m(2:Ny,1:Nx-1);


if bc ~= 0 % periodic boundary conditions
    
    % north
    m_N(1,:) = m(Ny,:);
    
    % south
    m_S(Ny,:) = m(1,:);
    
    % west
    m_W(:,1) = m(:,Nx);
    
    % east
    m_E(:,Nx) = m(:,1);
    
    % NW
    m_NW(1,2:Nx) = m(Ny,1:Nx-1);
    m_NW(2:Ny,1) = m(1:Ny-1,Nx);
    
    % NE
    m_NE(1,1:Nx-1) = m(Ny,2:Nx);
    m_NE(2:Ny,Nx) = m(1:Ny-1,1);
    
    % SW
    m_SW(Ny,2:Nx) = m(1,1:Nx-1);
    m_SW(1:Ny-1,1) = m(2:Ny,Nx);
    
    % SE
    m_SE(Ny,1:Nx-1) = m(1,2:Nx);
    m_SE(1:Ny-1,Nx) = m(2:Ny,1);
    
end

m_nb = m_N + m_S + m_E + m_W + ...
    m_NE + m_NW + m_SE + m_SW;

end

