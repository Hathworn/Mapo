#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {

#ifndef REAL
#define REAL float
#endif

#ifndef CAST
#define CAST(fun) fun ## f
#endif

#ifndef REAL2o3
#define REAL2o3 (REAL)0.6666666666666667
#endif

#ifndef REAL3o2
#define REAL3o2 (REAL)1.5
#endif

}

__global__ void vector_exp10 (const int n, const REAL* __restrict__ x, const int offset_x, const int stride_x, REAL* __restrict__ y, const int offset_y, const int stride_y) {
    // Use shared memory for data coalescing (optional)
    extern __shared__ REAL shared_x[];
    
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;
    if (gid < n) {
        // Use registers for better performance and avoid offset calculation in loop
        const int x_index = offset_x + gid * stride_x;
        const int y_index = offset_y + gid * stride_y;

        // Optionally use shared memory if within block size
        shared_x[threadIdx.x] = x[x_index];

        // Synchronize to ensure all numbers are loaded before computation
        __syncthreads();

        y[y_index] = CAST(exp10)(shared_x[threadIdx.x]);
    }
}