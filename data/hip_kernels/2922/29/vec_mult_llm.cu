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

__global__ void vec_mult(const float* A, const float* B, float* C, int N) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < N) // Ensure thread index is within array bounds
    {
        C[i] = A[i] * B[i]; // Perform element-wise multiplication
    }
}