#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matadd_1d(const float *a, const float *b, float *c, int n, int m) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if(i < n) {
        // Unroll loop for better memory access and performance
        #pragma unroll
        for(int j = 0; j < m; j++) {
            int idx = j * n + i;
            c[idx] = a[idx] + b[idx];
        }
    }
}