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

__global__ void ge_log1p (const int sd, const int fd, const REAL* a, const int offset_a, const int ld_a, REAL* b, const int offset_b, const int ld_b) {
    // Calculate global indices
    const int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    const int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if indices are within bounds
    if (gid_0 < sd && gid_1 < fd) {
        // Direct memory calculation to improve performance
        int index_a = offset_a + gid_0 + gid_1 * ld_a;
        int index_b = offset_b + gid_0 + gid_1 * ld_b;

        // Store the result
        b[index_b] = CAST(log1p)(a[index_a]);
    }
}

}