#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_add(int N, int *A, int *B, int *C) {
    // Utilize global index directly
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check boundary within index calculation itself
    if (i < N) {
        C[i] = A[i] + B[i];
    }
}