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
__global__ void sum(int* vec1, int* result, int* tmp1, const int count)
{
    // Calculate unique thread ID
    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    // Calculate pair index for reduction
    int n = count / 2;

    if (tid < n) {
        // Initial reduction step
        tmp1[tid] = vec1[tid] + vec1[tid + n];
    }
    __syncthreads();

    // Loop for parallel reduction
    for (unsigned int stride = n / 2; stride > 0; stride /= 2) {
        if (tid < stride) {
            // Continuation of reduction using stride
            tmp1[tid] += tmp1[tid + stride];
        }
        __syncthreads();
    }

    if (tid == 0) {
        // Write result from thread 0
        *result = tmp1[0];
    }
}