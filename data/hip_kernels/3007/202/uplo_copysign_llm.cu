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

__global__ void uplo_copysign (const int sd, const int unit, const int bottom, const REAL* a, const int offset_a, const int ld_a, const REAL* b, const int offset_b, const int ld_b, REAL* c, const int offset_c, const int ld_c) {
    const int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    const int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure threads only proceed if they are within bounds
    if (gid_0 < sd && gid_1 < sd) {
        // Pre-compute indices for memory access
        int idx_a = offset_a + gid_0 + gid_1 * ld_a;
        int idx_b = offset_b + gid_0 + gid_1 * ld_b;
        int idx_c = offset_c + gid_0 + gid_1 * ld_c;

        // Calculate condition for unit type
        bool condition = (unit == 132) ? bottom * gid_0 > bottom * gid_1 : bottom * gid_0 >= bottom * gid_1;

        // Perform copysign operation if condition is met
        if (condition) {
            c[idx_c] = CAST(copysign)(a[idx_a], b[idx_b]);
        }
    }
}