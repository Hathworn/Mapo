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

/*	add_up
*	Función del kernel para sumar hacia arriba todos los números que sean iguales.
*/
__device__ void stack_up(int *matriz, int anchura, int altura, int x, int y) {
    // Optimize loop condition using a single calculation
    for (int i = altura - 1; i > 0; i--) {
        if ((x != 0) && (matriz[x * anchura + y] != 0) && matriz[x * anchura + (y - anchura)] == 0) {
            matriz[x * anchura + (y - anchura)] = matriz[x * anchura + y];
            matriz[x * anchura + y] = 0;
        }
        __syncthreads(); // Ensure all threads reach this point before proceeding
    }
}

__device__ void add_up(int *matriz, int x, int y, int altura, int anchura) {
    if (x != 0 && y < anchura) {
        if (matriz[x * anchura + y] != 0) {
            if (matriz[x * anchura + y] == matriz[(x - 1) * anchura + y]) {
                int iguales = 1; // Initialize the count with 1
                // Loop unrolled for performance improvement
                for (int i = 1; i <= x; i++) {
                    if (matriz[x * anchura + y] != matriz[(x - i) * anchura + y]) break;
                    iguales++;
                }
                if (iguales % 2 == 0) {
                    matriz[(x - 1) * anchura + y] *= 2;
                    matriz[x * anchura + y] = 0;
                }
            } else if (matriz[(x - 1) * anchura + y] == 0) {
                matriz[(x - 1) * anchura + y] = matriz[x * anchura + y];
                matriz[x * anchura + y] = 0;
            }
        }
    }
}

__global__ void mov_upK(int *matriz, int anchura, int altura) {
    int x = threadIdx.x;
    int y = threadIdx.y;

    stack_up(matriz, anchura, altura, x, y);
    __syncthreads(); // Avoid unnecessary synchronizations
    add_up(matriz, x, y, altura, anchura);
    __syncthreads();
    stack_up(matriz, anchura, altura, x, y);
}