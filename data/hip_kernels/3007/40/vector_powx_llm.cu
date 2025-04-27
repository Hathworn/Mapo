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

__global__ void vector_powx (const int n, const REAL* x, const int offset_x, const int stride_x, const REAL b, REAL* y, const int offset_y, const int stride_y) {

    // Calculate global index
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure gid is within bounds
    if (gid < n) {
        // Direct access and computation
        const int x_index = offset_x + gid * stride_x;
        const int y_index = offset_y + gid * stride_y;

        // Perform power calculation
        y[y_index] = CAST(pow)(x[x_index], b);
    }
}