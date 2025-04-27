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

__global__ void vec_div(const float* A, const float* B, float* C, int N) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i < N) {
        // Optimize division by checking for zero in B
        float b_val = B[i];
        C[i] = (b_val != 0.0f) ? (A[i] / b_val) : 0.0f; // Avoid division by zero
    }
}