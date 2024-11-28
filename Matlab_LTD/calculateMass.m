function [mass] = calculateMass(length,width, height, density)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
volume = length*width*height;
mass = volume*density;
end