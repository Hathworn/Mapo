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

__global__ void vector_gamma (const int n, const REAL* __restrict__ x, const int offset_x, const int stride_x, REAL* __restrict__ y, const int offset_y, const int stride_y) {
    // Calculate global thread ID
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;

    // In-bounds check to avoid out-of-bounds memory access
    if (gid < n) {
        // Perform computation with optimized memory access
        y[offset_y + gid * stride_y] = CAST(tgamma)(x[offset_x + gid * stride_x]);
    }
}