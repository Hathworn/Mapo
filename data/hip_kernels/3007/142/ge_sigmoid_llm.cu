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

__global__ void ge_sigmoid (const int sd, const int fd, const REAL* __restrict__ a, const int offset_a, const int ld_a, REAL* __restrict__ b, const int offset_b, const int ld_b) {
    // Use built-in variables and __restrict__ qualifiers to optimize memory access
    const int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    const int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;
    if (gid_0 < sd && gid_1 < fd) {
        // Optimize by minimizing calculations within the loop
        REAL a_val = a[offset_a + gid_0 + gid_1 * ld_a];
        b[offset_b + gid_0 + gid_1 * ld_b] = CAST(tanh)((REAL)0.5 * a_val) * (REAL)0.5 + (REAL)0.5;
    }
}