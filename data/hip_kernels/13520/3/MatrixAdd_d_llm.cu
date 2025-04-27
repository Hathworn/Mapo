#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel for matrix addition
__global__ void MatrixAdd_d(float *A, float *B, float *C, int N) {
    // Calculate the row and column index for the current thread
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Linear index computation
    int index = i * N + j;
    
    // Check boundaries and perform the addition
    if (i < N && j < N) {
        C[index] = A[index] + B[index];
    }
}