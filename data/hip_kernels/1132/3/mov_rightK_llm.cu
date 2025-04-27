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

/*	stack_right
*	Shift non-zero elements to the right
*/
__device__ void stack_right(int *matriz, int anchura, int altura, int x, int y)
{
    for (int i = anchura - 1; i > 0; i--)
    {
        // Shift non-zero element if next is zero
        if ((y != anchura - 1) && (matriz[x*anchura + y] != 0) && matriz[x*anchura + (y + 1)] == 0)
        {
            matriz[x*anchura + (y + 1)] = matriz[x*anchura + y];
            matriz[x*anchura + y] = 0;
        }
        __syncthreads(); // Synchronize threads in the block
    }
}

/*	add_right
*	Add adjacent equal elements to the right
*/
__device__ void add_right(int *matriz, int x, int y, int altura, int anchura)
{
    if (y != anchura - 1 && y < anchura)
    {
        if (matriz[x*anchura + y] != 0)
        {
            if (matriz[x*anchura + y] == matriz[x*anchura + (y + 1)])
            {
                int iguales = 0;
                iguales++;
                for (int i = 1; y + i < anchura; i++)
                {
                    if (matriz[x*anchura + y] == matriz[x*anchura + (y + i)])
                    {
                        iguales++;
                    }
                    else {
                        break;
                    }
                }
                if (iguales % 2 == 0)
                {
                    matriz[x*anchura + (y + 1)] = matriz[x*anchura + (y + 1)] * 2;
                    matriz[x*anchura + y] = 0;
                }
            }
            else if (matriz[x*anchura + (y + 1)] == 0)
            {
                matriz[x*anchura + (y + 1)] = matriz[x*anchura + y];
                matriz[x*anchura + y] = 0;
            }
        }
    }
}

/*	mov_rightK
*	Global kernel function to move elements to the right
*/
__global__ void mov_rightK(int *matriz, int anchura, int altura)
{
    int x = threadIdx.x;
    int y = threadIdx.y;

    // Perform stacking and addition operations
    stack_right(matriz, anchura, altura, x, y);
    add_right(matriz, x, y, altura, anchura);
    __syncthreads();
    stack_right(matriz, anchura, altura, x, y);
}