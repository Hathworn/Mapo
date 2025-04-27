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

__global__ void ge_exp10 (const int sd, const int fd, const REAL* a, const int offset_a, const int ld_a, REAL* b, const int offset_b, const int ld_b) {
    const int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    const int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;

    // Use shared memory for faster data access if applicable
    __shared__ REAL shared_a_tile[32][32];
    const int lane_0 = threadIdx.x;
    const int lane_1 = threadIdx.y;
    if (gid_0 < sd && gid_1 < fd) {
        shared_a_tile[lane_0][lane_1] = a[offset_a + gid_0 + gid_1 * ld_a];
        __syncthreads(); // Ensure all threads have loaded their tiles

        // Compute exp10 using shared memory
        b[offset_b + gid_0 + gid_1 * ld_b] = CAST(exp10)(shared_a_tile[lane_0][lane_1]);
    }
}
```
