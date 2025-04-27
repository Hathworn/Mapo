#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixTransKernel(float *A, int rows, int cols) {
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure each thread swaps only elements in the upper triangular part
    if (j > i && j < cols && i < rows) {
        float tmp = A[i * cols + j];
        A[i * cols + j] = A[j * cols + i];
        A[j * cols + i] = tmp;
    }
}