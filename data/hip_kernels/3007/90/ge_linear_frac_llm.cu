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


__global__ void ge_linear_frac (const int sd, const int fd, const REAL* a, const int offset_a, const int ld_a, const REAL* b, const int offset_b, const int ld_b, const REAL scalea, const REAL shifta, const REAL scaleb, const REAL shiftb, REAL* c, const int offset_c, const int ld_c) {
    const int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    const int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;

    // Check for valid global index, assuming dimensions are multiples of block size
    if ((gid_0 < sd) && (gid_1 < fd)) {
        const int idx_a = offset_a + gid_0 + gid_1 * ld_a; // Pre-compute index for a
        const int idx_b = offset_b + gid_0 + gid_1 * ld_b; // Pre-compute index for b
        const int idx_c = offset_c + gid_0 + gid_1 * ld_c; // Pre-compute index for c

        // Simplify computation by using pre-computed indices
        c[idx_c] = (scalea * a[idx_a] + shifta) / (scaleb * b[idx_b] + shiftb);
    }
}

}