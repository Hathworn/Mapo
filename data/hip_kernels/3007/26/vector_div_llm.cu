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

__global__ void vector_div(const int n, const REAL* x, const int offset_x, const int stride_x, const REAL* y, const int offset_y, const int stride_y, REAL* z, const int offset_z, const int stride_z) {

    const int gid = blockIdx.x * blockDim.x + threadIdx.x;
  
    // Boundary check to ensure gid index is within bounds of the vector length
    if (gid < n) {
        // Prefetch indices to reduce index computation overhead
        const int x_index = offset_x + gid * stride_x;
        const int y_index = offset_y + gid * stride_y;
        const int z_index = offset_z + gid * stride_z;

        // Perform division and store result
        z[z_index] = x[x_index] / y[y_index];
    }
}