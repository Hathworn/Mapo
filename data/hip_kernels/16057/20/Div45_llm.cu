#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Div45(int *matrix , int *newMatrix, int nx, int ny, int Max) {
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;
    
    if (ix >= nx - 1 || iy >= ny - 1) return; // Boundary check

    int Index = iy * nx + ix;
    int posisi = 0;

    // Optimize the loop by eliminating redundant calculations
    int nxTimesIndex = ix + nx * (iy + 1);

    for (int i = 0; i < nx - 1; i++) {
        if (Index >= i * nx && Index < ((i + 1) * nx) - 1) {
            posisi = matrix[nxTimesIndex - nx + 1];
            atomicAdd(&newMatrix[posisi], 1);
            printf("Index : %d %d\n", nxTimesIndex - nx, Index + 1);
        }
    }
}