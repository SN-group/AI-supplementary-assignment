


"BLOCK WORLD"

struct block
  "'block model"
  function block(clear::Bool, on::Val{true})
    "'on refers to the object the block is on. None = Table"
    clear = true
    on = on

  function getOn(on) 
    "returns the object it's on"
    return on
  end
end
end
function userInput()
  print("Enter number of Tables?\n")
  e=readline()
  tableNumbers=parse(Int64, e)

  global tableList = Array{String}(undef, tableNumbers)
  for i=1:tableNumbers
  print("Name of table ",i,"?\n")
  tableList[i]=readline()
  end

  blocks=[]
  table=[]
  global tposition=0 
  aposition=0
  bposition=0
  print("Enter number of blocks?\n")
  n=readline()
  blockNumber=parse(Int64, n)

  global blockList = Array{String}(undef, blockNumber)
  for i=1:blockNumber
    print("Name of block ",i,"?\n")
    blockList[i] = readline()
    push!(blocks,blockList[i])
    push!(table,[])
  end

blocklength=length(blocks)
for i=1:blocklength
  print("Where do you want to put block ",blocks[i],"?\n1.In the box\n2.On the table\n3.On other block\n")
  c=readline()
  input=parse(Int64, c)
  if input==1
    if isequal(tposition,0)
      push!(table[1],blocks[i])
      global tposition += 1
    end

    elseif tposition>0
      print("\n Put it directly on the table?\n1.Yes\n2.No\n")
      t=readline()
      m=parse(Int64, t)
    end
  end
  

  println(" ***** THE INITIAL STATE *****")
  println()

    println("  ON"*tableList[1]*"("*blockList[1]*")")
    println("  ON("*blockList[1]*","*blockList[2]*")")
    println("  ON"*tableList[1]*"("*blockList[3]*")")
    println()
    
    println(" @@@@@@@ THE GOAL STATE @@@@@@@")
    println()

    println("  ON("*blockList[3]*","*blockList[2]*")")
    println("  ON"*tableList[1]*"("*blockList[3]*")")
    println("  ON"*tableList[1]*"("*blockList[1]*")")
    println()

end

function goalState()
  global comb = vcat(tableList, blockList)
  #println(comb)
  println("Result:")
  a = comb[5], comb[4]
  b = comb[1], comb[5]
  c = comb[1], comb[3]
  global goal = vcat(a, b, c)
  println(goal)
end 


#struct newNode
  

  function newNode(data)
    data = data  
    left = right = nothing
  end
 
root = nothing
#root = insertLevelOrder(comb, root, 0, n)
  
  # Function to insert nodes in level order  
  function insertLevelOrder(comb, root, i, n)
    n = length(comb) 
      
    # Base case for recursion  
    if i < n
        temp = newNode(comb[i])  
        root = temp  
  
        # insert left child  
        root.left = insertLevelOrder(comb, root.left, 
                                     2 * i + 1, n)  
  
        # insert right child  
        root.right = insertLevelOrder(comb, root.right, 
                                      2 * i + 2, n) 
    end
    return root 
  end

  visited = Set() # Set to keep track of visited nodes.

  function dfs(visited, comb, node)
    if node != visited
      print(node)
      visited.add(node)
        for neighbour in comb[node]
          dfs(visited, comb, neighbour)
        end
    end
  end

function action()
  # Choose the best algorithm that you can use achive the goal state
  # You can use A* algorithm
  # You can use Depth First Algorithm
  # Is [i] in a yes ON([i], [i]) If(No){is [i] in b yes OnTable([i])} If(No){[i] is in c}

end

  function getClear(clear)
    "'returns whether it's clear or not'''"
    return clear
  end


  function pickUp(X)
    "'''picks up block x if x empty'''"
    if not empty == true 
       throw(NotEmptyException)
    empty = x
    end
end
  
  function drop()
    "'''drops the block in hand'''"
    if not empty 
     throw(NoBlockInHandExceptionthrow)
     empty = true
    end
  end


struct blockWorld

    
  "World

  conditions:
    on(A, B)
    onTable(C)
    clear(A)
    empty

  operations:
    pickup(A)
    put(A, B)
    putOnTable(C)"

  function block(blocks=nothing, agent=agent) 
    blocks 
    agent
  end

  function isClear(X)
    "'''returns true if X is clear and False if otherwise'''"
    if X not in blocks
      throw(BlockNotFoundException)
    return X.getClear()
    end
end

  function addNewBlock(X)
    "appends block to world"
    if X in blocks
         return X
    block.append(X)
    return X
    end
end

  function newBlock(X=nothing)
    "'''creates a new block in world'''"
  end

  function on(X, Y) 
    "moves X on Y"
    if not Y in blocks
      blocks.append(Y)
    if X not in blocks
      blocks.append(X)
    end

      if isClear(Y)
      end
    end
  end
end



black1 = userInput()
block2 = goalState()
println(root)
#println(black1)
#println(block2)