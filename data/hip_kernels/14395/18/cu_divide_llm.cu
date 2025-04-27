#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cu_divide(float *numerator, float denominator, const int n) {
    // Use a common pattern that calculates only within bounds to avoid unneeded checks
    for (int tid = threadIdx.x + blockIdx.x * blockDim.x; tid < n; tid += blockDim.x * gridDim.x) {
        numerator[tid] = __fdividef(numerator[tid], denominator);
    }
}