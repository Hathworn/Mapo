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

__global__ void vector_cos(const int n, const REAL* __restrict__ x, const int offset_x, const int stride_x, REAL* __restrict__ y, const int offset_y, const int stride_y) {
    // Obtain the global thread ID
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if the global thread ID is within the array bounds
    if (gid < n) {
        // Compute the offset for input and output vectors and apply cosine function
        const int x_index = offset_x + gid * stride_x;
        const int y_index = offset_y + gid * stride_y;
        y[y_index] = CAST(cos)(x[x_index]);
    }
}