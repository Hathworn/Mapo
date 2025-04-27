#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void init(int n, float *x, float *y) {
    // Using shared memory for frequently accessed data
    __shared__ size_t shared_warp_total;
    
    int lane_id = threadIdx.x & 31;
    size_t warp_id = (threadIdx.x + blockIdx.x * blockDim.x) >> 5;
    size_t warps_per_grid = (blockDim.x * gridDim.x) >> 5;
    
    // Calculate total warps once and store in shared memory
    if (threadIdx.x == 0) {
        shared_warp_total = ((sizeof(float) * n) + STRIDE_64K - 1) / STRIDE_64K;
    }
    __syncthreads();

    // Load shared memory to local for use in loop
    size_t warp_total = shared_warp_total;

    for (; warp_id < warp_total; warp_id += warps_per_grid) {
        #pragma unroll
        for (int rep = 0; rep < STRIDE_64K / sizeof(float) / 32; rep++) {
            size_t ind = warp_id * STRIDE_64K / sizeof(float) + rep * 32 + lane_id;
            if (ind < n) {
                x[ind] = 1.0f;
                y[ind] = 2.0f;
            }
        }
    }
}
```
