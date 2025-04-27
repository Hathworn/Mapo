```c
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

// Optimized vector_expm1 kernel function
__global__ void vector_expm1(const int n, const REAL* __restrict__ x, const int offset_x, const int stride_x, 
                             REAL* __restrict__ y, const int offset_y, const int stride_y) {
    // Calculate global id
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;

    // Boundary check to ensure gid is within bounds
    if (gid < n) {
        // Read input and write output with memory coalescing
        const int x_idx = offset_x + gid * stride_x;
        const int y_idx = offset_y + gid * stride_y;
        y[y_idx] = CAST(expm1)(x[x_idx]);
    }
}