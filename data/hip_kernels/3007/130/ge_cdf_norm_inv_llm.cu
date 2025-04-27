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

__global__ void ge_cdf_norm_inv(const int sd, const int fd, const REAL* __restrict__ a, const int offset_a, const int ld_a, REAL* __restrict__ b, const int offset_b, const int ld_b) {
    // Calculate global thread indices
    const int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    const int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;

    // Optimization: use shared memory for performance improvement if needed.

    // Check bounds and perform calculation if valid
    if (gid_0 < sd && gid_1 < fd) {
        // Use efficient memory access by calculating global index once
        const int index_a = offset_a + gid_0 + gid_1 * ld_a;
        const int index_b = offset_b + gid_0 + gid_1 * ld_b;
        // Apply the normcdfinv function
        b[index_b] = CAST(normcdfinv)(a[index_a]);
    }
}