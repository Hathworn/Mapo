#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixAdd_CUDA(int *A, int *B, int *C, int width) {
    // Calculate the row index of the C matrix
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    // Calculate the column index of the C matrix
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    // Check bounds before accessing memory
    if (i < width && j < width) {
        // Perform matrix addition for the current element
        C[i * width + j] = A[i * width + j] + B[i * width + j];
    }
}