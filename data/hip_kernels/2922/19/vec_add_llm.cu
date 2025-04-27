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
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure the thread index is within bounds
    if (i < N) {
        // Perform vector addition
        C[i] = A[i] + B[i];
    }
}