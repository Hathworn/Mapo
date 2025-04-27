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
    // Optimize using a conditional and avoid unnecessary semicolon
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i < N) {
        C[i] = A[i] / B[i]; // Move assignment inside the conditional
    }
}