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

__global__ void vector_inv_sqrt (const int n, const REAL* x, const int offset_x, const int stride_x, REAL* y, const int offset_y, const int stride_y) {
    // Calculate global thread index
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure logical threads that map to physical threads do useful work
    if (gid < n) {
        // Perform inverse sqrt and store the result
        y[offset_y + gid * stride_y] = CAST(rsqrt)(x[offset_x + gid * stride_x]);
    }
}

}