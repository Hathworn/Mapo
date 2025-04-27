#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function for vector addition
__global__ void vector_add(double const *A, double const *B, double *C, int const N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we don't write to C when i is out of bounds
    if (i < N) {
        C[i] = A[i] + B[i];
    }
}