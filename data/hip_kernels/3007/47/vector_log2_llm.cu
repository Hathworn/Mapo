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

__global__ void vector_log2 (const int n, const REAL* x, const int offset_x, const int stride_x, REAL* y, const int offset_y, const int stride_y) {
    // Use shared memory to store x values to improve memory access patterns
    extern __shared__ REAL shared_x[];
    const int tid = threadIdx.x;
    const int gid = blockIdx.x * blockDim.x + tid;

    if (gid < n) {
        // Load x into shared memory
        shared_x[tid] = x[offset_x + gid * stride_x];
        __syncthreads(); // Ensure all x values are loaded

        // Write the result to y
        y[offset_y + gid * stride_y] = CAST(log2)(shared_x[tid]);
    }
}