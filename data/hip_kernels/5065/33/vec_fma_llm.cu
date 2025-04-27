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
    // Compute global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread operates within bounds
    if (i < N) {
        // Perform fused multiply-add operation
        D[i] = fmaf(B[i], C[i], A[i]);
    }
}