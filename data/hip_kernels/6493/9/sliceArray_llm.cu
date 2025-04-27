#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sliceArray(const int n, const int indx, const float *ss, float *zz) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Unroll loop for better performance
    #pragma unroll
    for (int idx = i; idx < n; idx += blockDim.x * gridDim.x) {
        zz[idx] = ss[idx + indx];
    }
}