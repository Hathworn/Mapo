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

__global__ void vector_mul (const int n, const REAL* x, const int offset_x, const int stride_x, const REAL* y, const int offset_y, const int stride_y, REAL* z, const int offset_z, const int stride_z) {
    // Calculate the global thread ID
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Only access valid indices within array bounds
    if (gid < n) {
        // Perform element-wise multiplication
        int x_index = offset_x + gid * stride_x;
        int y_index = offset_y + gid * stride_y;
        int z_index = offset_z + gid * stride_z;
        
        z[z_index] = x[x_index] * y[y_index];
    }
}

}