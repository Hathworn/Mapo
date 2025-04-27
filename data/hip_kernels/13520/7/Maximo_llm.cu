#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Maximo(double *input, double *results, int n) {
    extern __shared__ double sdata[];
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int tx = threadIdx.x;

    double x = (idx < n) ? input[idx] : -DBL_MAX; // Initialize with minimum double value for reduction
    sdata[tx] = x; 
    __syncthreads();

    // Use warp shuffle reduction to improve performance in the last warp
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (tx < offset) {
            if (sdata[tx] < sdata[tx + offset]) {
                sdata[tx] = sdata[tx + offset];
            }
        }
        __syncthreads();
    }

    if (tx == 0) {
        results[blockIdx.x] = sdata[0];
    }
}