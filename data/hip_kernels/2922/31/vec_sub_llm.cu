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

__global__ void vec_sub(const float* A, const float* B, float* C, int N) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    // Check if the index is within bounds and perform subtraction
    if (i < N) {
        C[i] = A[i] - B[i];  // Direct memory access for subtraction
    }
}