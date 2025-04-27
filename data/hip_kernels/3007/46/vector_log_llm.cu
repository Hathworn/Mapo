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

__global__ void vector_log(const int n, const REAL* x, const int offset_x, const int stride_x, REAL* y, const int offset_y, const int stride_y) {
    // Get global thread ID
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimization: Using shared memory for more efficient data access
    extern __shared__ REAL shared_x[];

    // Load data into shared memory
    if (gid < n) {
        shared_x[threadIdx.x] = x[offset_x + gid * stride_x];
        __syncthreads();

        // Apply log function and store result
        y[offset_y + gid * stride_y] = CAST(log)(shared_x[threadIdx.x]);
    }
}