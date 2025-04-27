#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void additionMatricesKernel(int* d_a, int* d_b, int* d_c) {
    // Calculate the global index for matrix access
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int j = threadIdx.y + blockIdx.y * blockDim.y;

    // Ensure we don't exceed matrix bounds and improve memory access
    if (i < N && j < N) {
        d_c[i * N + j] = d_a[i * N + j] + d_b[i * N + j];
    }
}