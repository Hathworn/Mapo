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

__global__ void vector_sinh (const int n, const REAL* x, const int offset_x, const int stride_x, REAL* y, const int offset_y, const int stride_y) {

    // Calculate global thread ID
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to optimize global memory access
    extern __shared__ REAL shared_x[];
    
    if (gid < n) {
        // Load data into shared memory
        shared_x[threadIdx.x] = x[offset_x + gid * stride_x];
        __syncthreads();

        // Perform computation using shared memory
        y[offset_y + gid * stride_y] = CAST(sinh)(shared_x[threadIdx.x]);
    }
}