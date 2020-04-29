// ----------------------------------------------------------------------
// ----------------------------------------------------------------------
// Atividade 9 ( Logica Fuzzy com Scilab )
// ----------------------------------------------------------------------
// Aluno: Arnaldo Alves Viana Junior
// Professor: Paulo Cugnasca
// Materia: PCS5708
// Data: 30/04/2020

// Importa fls
// Caso o arquivo atividade91.fls não estar no mesmo path do fls, passar o caminho completo
fls=loadfls("atividade92.fls");

scf();clf();

// Print das regras formadas
printrule(fls);

// Plot das variaveis de entrada e saida
// Input 1 altura
// Input 2 distancia 
// Output 1 pwm
scf();plotvar (fls, 'input', [1 2]);
scf();plotvar (fls, 'output', [1]);

// Plotsurf das entradas em relação a saida
scf();plotsurf (fls, [1 2], 1,[0 0]);
scf();
// Calcula a acelaração em função dos parametros de entrada 
//distancia baixa  e altura baixa 
[output, rule_input, fuzzy_output] = evalfls ([0.20 0.25], fls, 1001);
// ajuste de deixo e plot dos resultados.
x_axis = linspace (fls.output(1).range(1), fls.output(1).range(2), 1001);
plot (x_axis, fuzzy_output(:, 1), "b", 'LineWidth', 2);
aceleracao_output = mfeval(x_axis, 'constant', output(1));
plot ([aceleracao_output,aceleracao_output], [0 1], "r", 'LineWidth', 2);
legend(['saida agregada Fuzzy Output';'pwm de saida']);
xlabel ('PWM', 'fontsize', 2);
xgrid();
scf();
// Calcula a acelaração em função dos parametros de entrada velocidade e alimentação
//velocidade media  e alimentação media
//saida neutro 
[output, rule_input, fuzzy_output] = evalfls ([0.5 0.50], fls, 1001);
// ajuste de deixo e plot dos resultados.
x_axis = linspace (fls.output(1).range(1), fls.output(1).range(2), 1001);
plot (x_axis, fuzzy_output(:, 1), "b", 'LineWidth', 2);
aceleracao_output = mfeval(x_axis, 'constant', output(1));
plot ([aceleracao_output,aceleracao_output], [0 1], "r", 'LineWidth', 2);
legend(['saida agregada Fuzzy Output';'pwm de saida']);
xlabel ('PWM', 'fontsize', 2);
xgrid();
scf();
// Calcula a acelaração em função dos parametros de entrada velocidade e alimentação
//velocidade baixa  e alimentação baixa
//saida freio 
[output, rule_input, fuzzy_output] = evalfls ([0.750 0.75], fls, 1001);
// ajuste de deixo e plot dos resultados.
x_axis = linspace (fls.output(1).range(1), fls.output(1).range(2), 1001);
plot (x_axis, fuzzy_output(:, 1), "b", 'LineWidth', 2);
aceleracao_output = mfeval(x_axis, 'constant', output(1));
plot ([aceleracao_output,aceleracao_output], [0 1], "r", 'LineWidth', 2);
legend(['saida agregada Fuzzy Output';'pwm de saida']);
xlabel ('PWM', 'fontsize', 2);;
xgrid();
