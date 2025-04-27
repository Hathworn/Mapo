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

__global__ void vector_modf (const int n, const REAL* x, const int offset_x, const int stride_x, REAL* y, const int offset_y, const int stride_y, REAL* z, const int offset_z, const int stride_z) {

    // Calculate global thread ID
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread ID is within bounds
    if (gid < n) {
        const int x_idx = offset_x + gid * stride_x;
        const int y_idx = offset_y + gid * stride_y;
        const int z_idx = offset_z + gid * stride_z;
        
        // Optimized memory access
        REAL x_value = x[x_idx];
        z[z_idx] = CAST(modf)(x_value, &y[y_idx]);
    }
}