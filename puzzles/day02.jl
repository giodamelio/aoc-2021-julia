### A Pluto.jl notebook ###
# v0.17.2

using Markdown
using InteractiveUtils

# ╔═╡ 316378e8-c932-478e-8ddd-f55f537c6834
begin
	using IterTools
	using Chain
end

# ╔═╡ f4d42087-c55a-4dd8-85f5-9a126d71093a
md"""
# Day 1
"""

# ╔═╡ 1a29d455-0632-4590-85b6-c91a69dc9931
md"""
## Install Some Dependencies
"""

# ╔═╡ b2b8da6e-47b3-4e0c-964d-006e5a117966
md"""
## Types

Define some types to be used by the solution
"""

# ╔═╡ e460dcaa-1915-481b-9ccd-719ca1e516af
"A submarine command"
struct Command
	direction::String
	distance::Int64
end

# ╔═╡ 27feb57f-3f88-4929-ae58-81ce170b39e9
md"""
## Parse Input

Parse each line of the puzzle input into a Command
"""

# ╔═╡ 761ed68d-3e65-4d2a-980b-2157c402e14d
function parse_input(inputs::Vector{String})::Vector{Command}
	regex = r"(?<direction>forward|down|up) (?<distance>\d*)"
	@chain inputs begin
		match.(regex, _)
		map(m -> m.captures, _)
		map(m -> Command(m[1], parse(Int64, m[2])), _)
	end
end

# ╔═╡ 3e4ddda2-4b9f-4af4-bc29-141e66c71357
md"""
## Puzzle Inputs

Inline the example input and read/parse the real input
"""

# ╔═╡ 18b60aa6-52bd-11ec-17f4-47f0e4792cf7
example_input = [
	Command("forward", 5),
	Command("down", 5),
	Command("forward", 8),
	Command("up", 3),
	Command("down", 8),
	Command("forward", 2)
]

# ╔═╡ 963a2d47-47b4-43e3-9f92-f2814dc0eeaa
puzzle_input = @chain "../inputs/02.txt" begin
	open("r")
	read(String)
	strip
	split("\n")
	String.()
	parse_input()
end

# ╔═╡ ec42f95f-7b23-4a7b-a9cc-0fe115e4c736
md"""
## Part 1

Follow the commands and find out where we end up.
"""

# ╔═╡ 944db342-4311-498c-b6f7-8815dc1b4b7d
function part1(input)
	horizontal = 0
	depth = 0
	for command in input
		if command.direction == "forward"
			horizontal += command.distance
		elseif command.direction == "up"
			depth -= command.distance
		elseif command.direction == "down"
			depth += command.distance
		else
			error
		end
	end

	horizontal * depth
end

# ╔═╡ 1efcdf88-3863-4da1-a5dd-6d5aac073243
part1(example_input)

# ╔═╡ 6f8cfea6-b124-4674-b33e-74889a47d3dd
part1(puzzle_input)

# ╔═╡ 1d4361b2-c76a-4f10-b3dc-b2ec5a659038
md"""
## Part 2

Take Aim into account this time
"""

# ╔═╡ 08c84bf1-4e5b-4172-b9db-f81cc754cabf
function part2(input)
	horizontal = 0
	depth = 0
	aim = 0
	for command in input
		if command.direction == "forward"
			horizontal += command.distance
			depth += aim * command.distance
		elseif command.direction == "up"
			aim -= command.distance
		elseif command.direction == "down"
			aim += command.distance
		else
			error
		end
	end

	horizontal * depth
end

# ╔═╡ 088fad0f-bf2b-4e51-abe0-d0c48529e185
part2(example_input)

# ╔═╡ a4f57411-6fff-4b48-8902-49000a0c7d9c
part2(puzzle_input)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Chain = "8be319e6-bccf-4806-a6f7-6fae938471bc"
IterTools = "c8e1da08-722c-5040-9ed9-7db0dc04731e"

[compat]
Chain = "~0.4.8"
IterTools = "~1.3.0"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.0"
manifest_format = "2.0"

[[deps.Chain]]
git-tree-sha1 = "cac464e71767e8a04ceee82a889ca56502795705"
uuid = "8be319e6-bccf-4806-a6f7-6fae938471bc"
version = "0.4.8"

[[deps.IterTools]]
git-tree-sha1 = "05110a2ab1fc5f932622ffea2a003221f4782c18"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.3.0"
"""

# ╔═╡ Cell order:
# ╟─f4d42087-c55a-4dd8-85f5-9a126d71093a
# ╟─1a29d455-0632-4590-85b6-c91a69dc9931
# ╠═316378e8-c932-478e-8ddd-f55f537c6834
# ╟─b2b8da6e-47b3-4e0c-964d-006e5a117966
# ╠═e460dcaa-1915-481b-9ccd-719ca1e516af
# ╟─27feb57f-3f88-4929-ae58-81ce170b39e9
# ╠═761ed68d-3e65-4d2a-980b-2157c402e14d
# ╟─3e4ddda2-4b9f-4af4-bc29-141e66c71357
# ╠═18b60aa6-52bd-11ec-17f4-47f0e4792cf7
# ╠═963a2d47-47b4-43e3-9f92-f2814dc0eeaa
# ╟─ec42f95f-7b23-4a7b-a9cc-0fe115e4c736
# ╠═944db342-4311-498c-b6f7-8815dc1b4b7d
# ╠═1efcdf88-3863-4da1-a5dd-6d5aac073243
# ╠═6f8cfea6-b124-4674-b33e-74889a47d3dd
# ╠═1d4361b2-c76a-4f10-b3dc-b2ec5a659038
# ╠═08c84bf1-4e5b-4172-b9db-f81cc754cabf
# ╠═088fad0f-bf2b-4e51-abe0-d0c48529e185
# ╠═a4f57411-6fff-4b48-8902-49000a0c7d9c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
