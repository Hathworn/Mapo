#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void testKernel(int *s, const int *re) {
    __shared__ int temp[1];

    int i = threadIdx.x;

    // Use atomicMin to safely update temp[0] without race conditions
    if (re[i] > -1) {
        atomicMin(temp, re[i]);
    }

    __syncthreads();

    // Only one thread needs to write back the result
    if (i == 0) {
        *s = temp[0];
    }
}