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

__global__ void vector_fmax(const int n, const REAL* x, const int offset_x, const int stride_x, const REAL* y, const int offset_y, const int stride_y, REAL* z, const int offset_z, const int stride_z) {
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a loop to ensure all threads within block process multiple elements if needed
    for (int idx = gid; idx < n; idx += blockDim.x * gridDim.x) {
        z[offset_z + idx * stride_z] = CAST(fmax)(x[offset_x + idx * stride_x], y[offset_y + idx * stride_y]);
    }
}