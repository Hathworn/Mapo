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
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    // Use loop unrolling for better performance
    if (i < N) {
        D[i] = A[i] + B[i] * C[i];
        if (i + blockDim.x < N) D[i + blockDim.x] = A[i + blockDim.x] + B[i + blockDim.x] * C[i + blockDim.x];
        if (i + 2 * blockDim.x < N) D[i + 2 * blockDim.x] = A[i + 2 * blockDim.x] + B[i + 2 * blockDim.x] * C[i + 2 * blockDim.x];
        if (i + 3 * blockDim.x < N) D[i + 3 * blockDim.x] = A[i + 3 * blockDim.x] + B[i + 3 * blockDim.x] * C[i + 3 * blockDim.x];
    }
}