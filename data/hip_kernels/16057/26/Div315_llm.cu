#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Div315(int *matrix, int *newMatrix, int nx, int ny, int Max){
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;

    if (ix >= nx - 1 || iy >= ny) return;  // Early return if out of bounds

    int index = iy * nx + ix;
    int posisi = 0;

    // Combine conditions and iterate only over valid indices
    if (ix < nx - 1) {
        posisi = matrix[index] * nx + matrix[index + nx + 1];
        atomicAdd(&newMatrix[posisi], 1);
        // printf may be commented out in performance-sensitive code
        // printf("Index : %d %d\n", index, index + nx + 1);
    }
}