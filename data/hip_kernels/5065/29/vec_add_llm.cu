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

__global__ void vec_add(const float* A, const float* B, float* C, int N) {
    // Calculate global thread index
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Check if within bounds, then perform the addition
    if (i < N) {
        C[i] = A[i] + B[i];
    }
}