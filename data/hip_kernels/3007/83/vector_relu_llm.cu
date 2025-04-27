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

__global__ void vector_relu (const int n, const REAL alpha, const REAL* __restrict__ x, const int offset_x, const int stride_x, REAL* __restrict__ y, const int offset_y, const int stride_y) {

    // Calculate global index
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use loop unrolling for better performance
    for (int idx = gid; idx < n; idx += gridDim.x * blockDim.x) {
        const REAL val = x[offset_x + idx * stride_x];
        y[offset_y + idx * stride_y] = CAST(fmax)(val, alpha * val);
    }
}