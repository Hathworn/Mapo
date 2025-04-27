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

__global__ void vector_erf_inv (const int n, const REAL* x, const int offset_x, const int stride_x, REAL* y, const int offset_y, const int stride_y) {
    int gid = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread ID
    if (gid >= n) return; // Early exit for threads outside the limit
    // Calculate indices and perform operation
    y[offset_y + gid * stride_y] = CAST(erfinv)(x[offset_x + gid * stride_x]);
}