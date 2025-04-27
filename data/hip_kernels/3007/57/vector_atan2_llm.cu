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

__global__ void vector_atan2(const int n, const REAL* x, const int offset_x, const int stride_x, 
                             const REAL* y, const int offset_y, const int stride_y, 
                             REAL* z, const int offset_z, const int stride_z) {
    // Calculate global thread index
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread is within bounds
    if (gid < n) {
        // Compute and store result
        int idx_x = offset_x + gid * stride_x;
        int idx_y = offset_y + gid * stride_y;
        int idx_z = offset_z + gid * stride_z;
        z[idx_z] = CAST(atan2)(x[idx_x], y[idx_y]);
    }
}

}