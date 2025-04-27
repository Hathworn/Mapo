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

__global__ void ge_atanh (const int sd, const int fd, const REAL* a, const int offset_a, const int ld_a, REAL* b, const int offset_b, const int ld_b) {
    // Use 1D grid for all elements and compute global index
    const int tid = blockIdx.x * blockDim.x + threadIdx.x;
    const int total_threads = gridDim.x * blockDim.x;

    for (int idx = tid; idx < sd * fd; idx += total_threads) {
        int gid_0 = idx % sd;  // Calculate gid_0 from 1D index
        int gid_1 = idx / sd;  // Calculate gid_1 from 1D index
        b[offset_b + gid_0 + gid_1 * ld_b] = CAST(atanh)(a[offset_a + gid_0 + gid_1 * ld_a]);
    }
}

}