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

__global__ void vector_cdf_norm (const int n, const REAL* x, const int offset_x, const int stride_x, REAL* y, const int offset_y, const int stride_y) {
    int gid = blockIdx.x * blockDim.x + threadIdx.x;
    /* Check if gid is within bounds and optimize memory access pattern */
    if (gid < n) {
        int x_index = offset_x + gid * stride_x;  // Precompute indices for reuse
        int y_index = offset_y + gid * stride_y;
        y[y_index] = CAST(normcdf)(x[x_index]);
    }
}