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

__global__ void vector_atanh (const int n, const REAL* x, const int offset_x, const int stride_x, REAL* y, const int offset_y, const int stride_y) {

    int gid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a loop to handle potential out-of-bounds accesses in case of non-multiple block/thread sizes
    for(int i = gid; i < n; i += gridDim.x * blockDim.x) {
        y[offset_y + i * stride_y] = CAST(atanh)(x[offset_x + i * stride_x]);
    }
}