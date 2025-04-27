#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

void showMatriz(int *matriz, int anchura, int altura);
void generateSeeds(int *matriz, int ancho, int alto, int cantidad, char modo);
void gestionSemillas(int *matriz, int ancho, int numeroSemillas, int alto, char modo);
int checkFull(int *matriz, int tamano);
bool checkMove(int *matriz, int ancho, int alto);
void guardar(int vidas, int *tablero, int altura, int anchura, char dificultad);
int* cargar();
int* MostrarEspecificaciones();

hipError_t cudaStatus;

/* Optimize the stack_down function using a single loop */
__device__ void stack_down(int *matriz, int anchura, int altura, int x, int y) {
    // Loop from the second last row upwards to optimize memory access
    for (int i = altura - 2; i >= 0; i--) {
        if ((matriz[i*anchura + y] != 0) && matriz[(i+1)*anchura + y] == 0) {
            matriz[(i + 1)*anchura + y] = matriz[i*anchura + y];
            matriz[i*anchura + y] = 0;
        }
        __syncthreads();
    }
}

/* Optimize the add_down function to reduce unnecessary computations */
__device__ void add_down(int *matriz, int x, int y, int altura, int anchura) {
    if (x < altura - 1 && y < anchura) {
        if (matriz[x*anchura + y] != 0) {
            if (matriz[x*anchura + y] == matriz[(x + 1)*anchura + y]) {
                matriz[(x + 1)*anchura + y] *= 2;
                matriz[x*anchura + y] = 0;
            } else if (matriz[(x + 1)*anchura + y] == 0) {
                matriz[(x + 1)*anchura + y] = matriz[x*anchura + y];
                matriz[x*anchura + y] = 0;
            }
        }
    }
}

__global__ void mov_downK(int *matriz, int anchura, int altura) {
    int x = threadIdx.x;
    int y = threadIdx.y;

    stack_down(matriz, anchura, altura, x, y);
    __syncthreads();
    add_down(matriz, x, y, altura, anchura);
    __syncthreads();
    stack_down(matriz, anchura, altura, x, y);
}