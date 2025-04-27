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

__global__ void vec_sub(const float* __restrict__ A, const float* __restrict__ B, float* __restrict__ C, int N) {
    // Use shared memory to store temporary results
    extern __shared__ float cache[];

    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Check boundary condition
    if (i < N) {
        // Use registers to minimize global memory access
        float a = A[i];
        float b = B[i];
        
        // Perform subtraction
        C[i] = a - b;
    }
}