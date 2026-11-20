# Creating nix-shell environment for running the project programs using VSCodium

{ pkgs ? import <nixpkgs> {} }:

let
    python = pkgs.python3.withPackages (ps: with ps; [
	numpy
	pandas
	scipy
	matplotlib
	yfinance
	networkx
	requests
	jinja2  # needed by pandas to write LaTeX tables
	ipykernel  # to let VSCodium run notebook shells
	nbformat
	notebook
	pip
	jupyter
    ]);
in
pkgs.mkShell {
    packages = [
	python
	# pkgs.texlive.combined.scheme-medium  # may be required to compile report
    ];
}
