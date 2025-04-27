#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef __cplusplus
extern "C" {
#endif

#ifdef __cplusplus
}
#endif

__global__ void sum(int *vec1, int *result, int *tmp1, const int count)
{
    // Calculate global thread ID
    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    // Perform first step of parallel reduction
    if (tid < count / 2) {
        tmp1[tid] = vec1[tid] + vec1[tid + count / 2];
    }
    __syncthreads();

    // Perform the reduction using shared memory if possible
    for (unsigned int stride = count / 4; stride > 0; stride /= 2) {
        if (tid < stride) {
            tmp1[tid] += tmp1[tid + stride];
        }
        __syncthreads();
    }

    // Write the final result
    if (tid == 0) {
        *result = tmp1[0];
    }
}