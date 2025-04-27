#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void insertArray(const int n, const int indx, const float *ss, float *zz) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;

    // Unroll loop to optimize memory accesses
    #pragma unroll
    for (; i < n; i += blockDim.x * gridDim.x) {
        zz[indx + i] = ss[i];
    }
}