#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_scalar(float *v, float other, int n) {
    // Calculate global thread index
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use grid stride loop for more parallelism
    for (int idx = x; idx < n; idx += blockDim.x * gridDim.x) {
        v[idx] += other;
    }
}