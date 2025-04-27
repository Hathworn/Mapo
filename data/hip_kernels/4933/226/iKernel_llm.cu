#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void iKernel(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure boundary check and leverage memory coalescing
    if (i < N) {
        float a_val = A[i];  // Load into register
        float b_val = B[i];  // Load into register
        C[i] = a_val + b_val;  // Use registers for computation
    }
}