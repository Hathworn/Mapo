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

__device__ void stack_left(int *matriz, int anchura, int altura, int x, int y) {
    // Loop optimization: boundary condition inside the loop
    if ((y != 0) && (matriz[x * anchura + y] != 0)) {
        for (int i = 0; i < anchura - 1; i++) {
            if (matriz[x * anchura + (y - 1)] == 0) {
                matriz[x * anchura + (y - 1)] = matriz[x * anchura + y];
                matriz[x * anchura + y] = 0;
            }
            __syncthreads(); // Maintain thread synchronization
        }
    }
}

__device__ void add_left(int *matriz, int x, int y, int altura, int anchura) {
    if (y != 0 && y < anchura) {
        if (matriz[x * anchura + y] != 0) {
            if (matriz[x * anchura + y] == matriz[x * anchura + (y - 1)]) {
                int iguales = 0;
                iguales++;
                for (int i = 1; i <= y; i++) {
                    if (matriz[x * anchura + y] == matriz[x * anchura + (y - i)]) {
                        iguales++;
                    } else {
                        break;
                    }
                }
                if (iguales % 2 == 0) {
                    matriz[x * anchura + (y - 1)] = matriz[x * anchura + (y - 1)] * 2;
                    matriz[x * anchura + y] = 0;
                }
            } else if (matriz[x * anchura + (y - 1)] == 0) {
                matriz[x * anchura + (y - 1)] = matriz[x * anchura + y];
                matriz[x * anchura + y] = 0;
            }
        }
    }
}

__global__ void mov_leftK(int *matriz, int anchura, int altura) {
    int x = blockIdx.x * blockDim.x + threadIdx.x; // Change to global indexing
    int y = blockIdx.y * blockDim.y + threadIdx.y; // Change to global indexing

    if (x < altura && y < anchura) { // Ensure threads are within bounds
        stack_left(matriz, anchura, altura, x, y);
        add_left(matriz, x, y, altura, anchura);
        __syncthreads();
        stack_left(matriz, anchura, altura, x, y);
    }
}