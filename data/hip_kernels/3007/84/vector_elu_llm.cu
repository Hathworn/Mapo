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

__global__ void vector_elu (const int n, const REAL alpha, const REAL* x, const int offset_x, const int stride_x, REAL* y, const int offset_y, const int stride_y) {
    // Improve data locality by minimizing complex calculations in each iteration
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;
    if (gid < n) {
        const int x_index = offset_x + gid * stride_x;
        const int y_index = offset_y + gid * stride_y;
        const REAL val = x[x_index];
        y[y_index] = CAST(fmax)(val, alpha * expm1(val)); // Calculate y in one step
    }
}

}