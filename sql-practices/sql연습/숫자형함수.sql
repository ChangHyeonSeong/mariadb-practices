-- 함수: 수학

-- abs
select abs(-1), abs(1);

-- mod
select mod(10, 3);

-- floor x보다 크지 않은 가장 큰 정수
select floor(3.14);
select floor(-1.999);

-- ceil x보다 작지 않은 가장 작은 정수
select ceil(-1.999);
select ceil(3.14);
select ceiling(3.14);

-- round(x) : x에 가장 근접한 정수
select round(1.298);

-- round(x, d): x값 중에 소수점 d자리에 가장 근접한 실수
select round(1.498), round(1.498,1), round(1.4986,3);

-- pow(x.y), power(x.y) x의 y승
select pow(2,10), power(10,2);

-- sign(x)
select sign(20), sign(-100), sign(0);

-- greatest(x, y, .......), least(x, y, ......)
select greatest(10, 40, 20, 30), least(10, 40, 20, 30);
select greatest(10, 40, 20, 30), greatest('hello', 'world', 'apple');

