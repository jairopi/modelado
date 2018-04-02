function practica_ARQ_SW

%datos partida
Lcanal = 70; %perdidas del canal (en dB)
K = 1.38e-23; %constante de Boltzmann
T = 290; %temperatura de ruido en la antena
F = 12; %figura de ruido del receptor (en dB)
g = 10; %ganancia del transmisor y del receptor (en dB)
d = 1000; %distancia en metros
p_tx = 10; %potencia de transmisión en dBm
t_prop = 0.005; %tiempo de propagación en ms

p_tx_W = 10^(p_tx/10)*0.001; %potencia de transmisión en W
p_rx = p_tx_W*10^(g/10)*10^(g/10)*10^(-Lcanal/10)/d^2; %potencia recibida
N_o = K*(T+T*(10^(F/10)-1)); %densidad espectral de ruido

R = 300000; %tasa inicial en bits/s

Pe = 0.5*exp(-p_rx/(R*N_o))/sqrt(pi()*p_rx/(R*N_o)); %Probabilidad de error de bit

lc = XX; %cabecera del paquete en bits --> asigne un valor entre 8 y 40
lA = XX; %tamaño total del ACK en bits --> asigne un valor entre 20 y 140

load_min = 10;
load_max = 3000;
load_step = 10;

loadvector = load_min:load_step:load_max;

Et = p_tx_W/R;

B = zeros(1,length(loadvector));
E = zeros(1,length(loadvector));
index = 1;

for Ll = loadvector    
    lP = Ll + lc;
    t_tx = lP/R;
    t_a = lA/R;
    t_timer = 2*t_prop + t_a + 0.001;

    p1 = %% escriba aquí la fórmula correspondiente
    p2 = %% escriba aquí la fórmula correspondiente

    P = %% escriba aquí la matriz correspondiente
    g = %% escriba aquí el vector correspondiente
    v = %% obtenga el vector v
    bits_entregados_por_segundo = %obtenga este valor
    B(index) = bits_entregados_por_segundo;
    
    g = %% escriba aquí el vector correspondiente
    v = %% obtenga el vector v
    energia_por_bit_entregado = %obtenga este valor
    E(index) = energia_por_bit_entregado;
    index = index + 1;
end

% Obtenga la carga del paquete (Ll) que maximiza el throughput

% Obtenga la carga del paquete (Ll) que minimiza el consumo energético

% Represente  el throughput frente a bits de carga del paquete (Ll)

% Represente  el consumo energético frente a bits de carga del paquete (Ll)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load_min = 50;
load_max = 20000;
load_step = 50;

loadvector = load_min:load_step:load_max;

rate_min = 100000;
rate_max = 350000;
rate_step = 5000;
ratevector = rate_min:rate_step:rate_max;

Bmatrix = zeros(length(loadvector),length(ratevector));
Ematrix = zeros(length(loadvector),length(ratevector));
fila = 1;
for Ll = loadvector
    B = zeros(1,length(ratevector));
    E = zeros(1,length(ratevector));
    columna = 1;
    for R= ratevector
        lP = Ll + lc;
        t_tx = lP/R;
        t_a = lA/R;
        t_timer = 2*t_prop + t_a + 0.001;

        BER = %% escriba aquí la fórmula correspondiente

        p1 = % escriba aquí la fórmula correspondiente
        p2 = %% escriba aquí la fórmula correspondiente

        P = %% escriba aquí la matriz correspondiente
        g = %% escriba aquí el vector correspondiente
        v = %% obtenga el vector v
        bits_entregados_por_segundo = %obtenga este valor
        B(columna) = bits_entregados_por_segundo;

        Et = p_tx_W/R;

        g = %% escriba aquí el vector correspondiente
        v = %% obtenga el vector v
        energia_por_bit_entregado = %obtenga este valor
        E(columna) = energia_por_bit_entregado;  
        columna = columna + 1;
    end
    Bmatrix(fila,:) = B;
    Ematrix(fila,:) = E;
    fila = fila + 1;
end

% Obtenga la combinación que maximiza el throughput

% Obtenga la combinación que minimiza el consumo energético

% Represente el throughput frente a los valores de tasa y bits de carga








