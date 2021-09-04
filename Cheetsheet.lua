
-- 代入
a1,a2 = 10,20
a3,a4,a5 = 10,20,30

-- Swap
a1,a2 = a2,a1

print(a1,a2)

-- Booleasn

t, f = true, false

-- 関数

function myPrint(value)
	if (value == nil) then
		print("nil check")
	else 
		print(value);	
	end
end	

-- 関数を変数に入れる

myPrintObject = function (value)
	if (value == nil) then
		print("nil check")
	else 
		print(value);	
	end
end	



-- 配列
-- # は長さオペレータで、変数の前につけて使う。文字列の場合は文字列の長さ、配列の場合は要素数が取得できる
myArray = {10,20,30,40,50,60,70,80,90};
for i = 1,#myArray do
	local value = myArray[i] -- local変数
	-- 関数呼び出し
	myPrint(value)
	-- 関数オブジェクト呼び出し
	myPrintObject(value)
end


-- io.output("lua_output.txt")

-- 検索＆置換
txt = "score for orchestra, electronics and mime"
regEx = "[a-z]o[a-z]"
replaced = "*"

result = string.gsub(txt, regEx, replaced)
print(result)
io.write(result.."\n") -- 文字の連結 ..

-- 正規表現にマッチした文字列を高速列挙で取り出す
for str in string.gmatch(txt,regEx) do
	print(str)
	io.write(str.."\n")
end

-- 乱数
math.randomseed(os.time())
randomList = {}
for i = 1,9 do
	randomList[i] = 0
end

for i = 1,100 do
	n = math.random(9)
	randomList[n] = randomList[n] + 1
end


for i = 1,9 do
	local s = string.rep("*",randomList[i])
	print(i .. ":" .. s)
end

-- Table

-- 初期化
player1 = {name = "n1", firstname = "fn1", age = 40 }
player2 = {name = "n2", firstname = "fn2", age = 10}

-- テーブルを含むテーブル
members = {}
members[1] = player1
members[2] = player2

-- or
members = {player1,player2}

-- 要素へアクセス
print(members[1].firstname)
print(members[2].firstname)

-- 要素を新しく追加
members[3] = {name = "n3", firstname = "fn3", age = 25 }
members[4] = {name = "n4", firstname = "fn4", age = 4 }

--　フィールド名でアクセス
for i = 1, #members do
	print(members[i]["age"])	
end


-- コンストラクタ関数を使ったテーブルの初期化
function ball(t)
	if (not t.x) then
		t.x = math.random(0,100)
	end
	if (not t.y) then
		t.y = math.random(0,100)
	end
	return t
end

math.randomseed(os.time())

-- ball{} は ball({}) の省略形
balls = {
	ball{id = 1, x = 50},
	ball{id = 2, y = 10},
	ball{id = 3 }
}

for i = 1, #balls do
	b = balls[i]
	print ("id:"..b.id.." x:"..b.x.." y:"..b.y)
end