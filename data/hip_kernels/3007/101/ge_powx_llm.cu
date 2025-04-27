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

__global__ void ge_powx(const int sd, const int fd, const REAL* a, const int offset_a, const int ld_a, const REAL b, REAL* c, const int offset_c, const int ld_c) {
    // Compute global thread indices
    const int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    const int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds
    if ((gid_0 < sd) && (gid_1 < fd)) {
        // Compute linear indices
        int idx_a = offset_a + gid_0 + gid_1 * ld_a;
        int idx_c = offset_c + gid_0 + gid_1 * ld_c;

        // Perform power calculation and assign result
        c[idx_c] = CAST(pow)(a[idx_a], b);
    }
}