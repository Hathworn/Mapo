#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Div225(int *matrix, int *newMatrix, int nx, int ny, int Max) {
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;

    int Index = iy * nx + ix;
    
    // Check if within bounds
    if (ix < nx - 1 && iy < ny - 1) {
        int posisi = matrix[Index + 1] * nx + matrix[Index + nx];
        // Atomic add to prevent race conditions
        atomicAdd(&newMatrix[posisi], 1);
    }
}