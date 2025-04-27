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

__global__ void vector_cdf_norm_inv (const int n, const REAL* x, const int offset_x, const int stride_x, REAL* y, const int offset_y, const int stride_y) {
    // Calculate global ID once and store in a register
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use conditional gating to prevent out-of-bounds access
    if (gid < n) {
        const int x_index = offset_x + gid * stride_x; // Pre-calculate memory index
        const int y_index = offset_y + gid * stride_y; // Pre-calculate memory index
        y[y_index] = CAST(normcdfinv)(x[x_index]);
    }
}