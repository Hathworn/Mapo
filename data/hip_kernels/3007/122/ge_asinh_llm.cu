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
__global__ void ge_asinh (const int sd, const int fd, const REAL* a, const int offset_a, const int ld_a, REAL* b, const int offset_b, const int ld_b) {
    // Calculate global index once and store in register for reuse
    const int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    const int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;
    // Check if the thread index is within bounds
    if (gid_0 < sd && gid_1 < fd) {
        // Calculate flattened index to access global memory efficiently
        const int idx_a = offset_a + gid_0 + gid_1 * ld_a;
        const int idx_b = offset_b + gid_0 + gid_1 * ld_b;
        // Directly save result, minimizing memory accesses
        b[idx_b] = CAST(asinh)(a[idx_a]);
    }
}