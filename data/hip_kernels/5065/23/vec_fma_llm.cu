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
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Check bounds and perform operation if within range
    if (i < N) {
        D[i] = A[i] + B[i] * C[i];
    }
}