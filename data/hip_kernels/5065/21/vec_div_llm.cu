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

// Optimized kernel function for vector division
__global__ void vec_div(const float* A, const float* B, float* C, int N) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure index is within bounds and calculate division
    if (i < N) {
        C[i] = A[i] / B[i];
    }
}