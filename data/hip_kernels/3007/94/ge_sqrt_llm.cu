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

__global__ void ge_sqrt (const int sd, const int fd, const REAL* __restrict__ a, const int offset_a, const int ld_a, REAL* __restrict__ b, const int offset_b, const int ld_b) {
    // Calculate unique global index for each thread
    int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure within bounds before processing
    if (gid_0 < sd && gid_1 < fd) {
        // Perform square root using the casted function
        b[offset_b + gid_0 + gid_1 * ld_b] = CAST(sqrt)(a[offset_a + gid_0 + gid_1 * ld_a]);
    }
}