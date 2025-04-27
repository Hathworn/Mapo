#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GPUMult(int *A, int *B, int *C, int WIDTH)
{
    int sol = 0;
    int i = threadIdx.x + blockIdx.x * blockDim.x;  // Calculate global row index
    int j = threadIdx.y + blockIdx.y * blockDim.y;  // Calculate global column index

    if (i < WIDTH && j < WIDTH) {
        for (int k = 0; k < WIDTH; k++) {
            sol += A[j * WIDTH + k] * B[k * WIDTH + i];
        }
        C[j * WIDTH + i] = sol;
    }
}