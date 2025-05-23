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

__global__ void vector_linear_frac(const int n, const REAL* __restrict__ x, const int offset_x, const int stride_x, const REAL* __restrict__ y, const int offset_y, const int stride_y, const REAL scalea, const REAL shifta, const REAL scaleb, const REAL shiftb, REAL* __restrict__ z, const int offset_z, const int stride_z) {
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;

    // Check gid against n and execute aligned memory access for better performance
    if (gid < n) {
        REAL x_val = x[offset_x + gid * stride_x];
        REAL y_val = y[offset_y + gid * stride_y];
        z[offset_z + gid * stride_z] = (scalea * x_val + shifta) / (scaleb * y_val + shiftb);
    }
}