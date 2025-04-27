#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef __cplusplus
extern "C" {
#endif

/****** Single precision *****/

/****** Double precision *****/

#ifdef __cplusplus
}
#endif

__global__ void vec_fma(const float* A, const float* B, float* C, float* D, int N) {
    // Calculate global thread index
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    // Thread index is within bounds
    if (i < N) {
        // Perform fused multiply-add operation
        D[i] = A[i] + B[i] * C[i];
    }
}