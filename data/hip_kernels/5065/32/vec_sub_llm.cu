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
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread index
    if (i < N) {  // Ensure thread is within array bounds
        C[i] = A[i] - B[i];  // Perform the subtraction and store result
    }
}