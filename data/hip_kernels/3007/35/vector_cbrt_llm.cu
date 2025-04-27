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

__global__ void vector_cbrt (const int n, const REAL* x, const int offset_x, const int stride_x, REAL* y, const int offset_y, const int stride_y) {

    // Calculate global index
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure gid is within array bounds
    if (gid < n) {
        // Efficient memory access pattern
        const int input_idx = offset_x + gid * stride_x;
        const int output_idx = offset_y + gid * stride_y;

        // Perform cubic root on input and store in output
        y[output_idx] = CAST(cbrt)(x[input_idx]);
    }
}