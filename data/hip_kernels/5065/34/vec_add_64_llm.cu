#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef __cplusplus
extern "C" {
#endif

// Optimized kernel with coalesced memory access
__global__ void vec_add_64(const double* A, const double* B, double* C, int N) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i < N) {
        C[i] = A[i] + B[i]; // Coalesced memory access
    }
}

#ifdef __cplusplus
}
#endif