#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void chooseDistance(const int nwl, const int *kex, const float *didi11, float *didi1) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    if (i < nwl) {
        // Use register variables for faster access
        int indexWithOffset = i + kex[i] * nwl;
        didi1[i] = __ldg(&didi11[indexWithOffset]); // Use __ldg to utilize read-only cache for didi11
    }
}