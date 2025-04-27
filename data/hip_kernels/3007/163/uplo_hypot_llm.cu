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

__global__ void uplo_hypot (const int sd, const int unit, const int bottom, const REAL* a, const int offset_a, const int ld_a, const REAL* b, const int offset_b, const int ld_b, REAL* c, const int offset_c, const int ld_c) {
    // Calculate flattened global thread indices
    const int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    const int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;

    // Prefetch the multipliers
    const REAL multiplier_a = bottom * gid_0;
    const REAL multiplier_b = bottom * gid_1;

    // Check the conditions for valid execution
    if ((gid_0 < sd) && (gid_1 < sd) && 
        ((unit == 132) ? multiplier_a > multiplier_b : multiplier_a >= multiplier_b)) 
    {
        // Calculate the indices for input arrays and compute hypot
        const int idx_a = offset_a + gid_0 + gid_1 * ld_a;
        const int idx_b = offset_b + gid_0 + gid_1 * ld_b;
        const int idx_c = offset_c + gid_0 + gid_1 * ld_c;
        c[idx_c] = CAST(hypot)(a[idx_a], b[idx_b]);
    }
}

}