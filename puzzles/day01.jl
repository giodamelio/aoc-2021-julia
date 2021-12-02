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

# ╔═╡ 3e4ddda2-4b9f-4af4-bc29-141e66c71357
md"""
## Puzzle Inputs

Inline the example input and read/parse the real input
"""

# ╔═╡ 18b60aa6-52bd-11ec-17f4-47f0e4792cf7
example_input = [199,200,208,210,200,207,240,269,260,263]

# ╔═╡ 963a2d47-47b4-43e3-9f92-f2814dc0eeaa
puzzle_input = @chain "../inputs/01.txt" begin
	open("r")
	read(String)
	strip
	split("\n")
	parse.(Int64, _)
end

# ╔═╡ ec42f95f-7b23-4a7b-a9cc-0fe115e4c736
md"""
## Part 1

Count how many times the depth increases
"""

# ╔═╡ 944db342-4311-498c-b6f7-8815dc1b4b7d
@doc """
Split input into overlapping pairs, find the differences and count the amount of positive results
"""
function part1(input)
	@chain input begin
		partition(2, 1)
		Iterators.map(x -> x[2] - x[1], _)
		Iterators.count(x -> x > 0, _)
	end
end

# ╔═╡ 1efcdf88-3863-4da1-a5dd-6d5aac073243
part1(example_input)

# ╔═╡ 6f8cfea6-b124-4674-b33e-74889a47d3dd
part1(puzzle_input)

# ╔═╡ 1d4361b2-c76a-4f10-b3dc-b2ec5a659038
md"""
## Part 1
"""

# ╔═╡ 08c84bf1-4e5b-4172-b9db-f81cc754cabf
@doc """
Split input into overlapping triplets, sum them, then call part 1 to find the increases
"""
function part2(input)
	@chain input begin
		partition(3, 1)
		Iterators.map(x -> x[1] + x[2] + x[3], _)
		part1()
	end
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
# ╟─3e4ddda2-4b9f-4af4-bc29-141e66c71357
# ╟─18b60aa6-52bd-11ec-17f4-47f0e4792cf7
# ╠═963a2d47-47b4-43e3-9f92-f2814dc0eeaa
# ╟─ec42f95f-7b23-4a7b-a9cc-0fe115e4c736
# ╠═944db342-4311-498c-b6f7-8815dc1b4b7d
# ╠═1efcdf88-3863-4da1-a5dd-6d5aac073243
# ╠═6f8cfea6-b124-4674-b33e-74889a47d3dd
# ╟─1d4361b2-c76a-4f10-b3dc-b2ec5a659038
# ╠═08c84bf1-4e5b-4172-b9db-f81cc754cabf
# ╠═088fad0f-bf2b-4e51-abe0-d0c48529e185
# ╠═a4f57411-6fff-4b48-8902-49000a0c7d9c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
