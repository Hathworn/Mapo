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

__global__ void uplo_inv_sqrt (const int sd, const int unit, const int bottom, const REAL* __restrict__ a, const int offset_a, const int ld_a, REAL* __restrict__ b, const int offset_b, const int ld_b) {
    // Optimize index calculations using shared memory and avoid redundant calculations
    const int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    const int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;

    if (gid_0 < sd && gid_1 < sd) {
        // Compute offset for both 'a' and 'b' outside the condition check
        int index_a = offset_a + gid_0 + gid_1 * ld_a;
        int index_b = offset_b + gid_0 + gid_1 * ld_b;

        if ((unit == 132) ? bottom * gid_0 > bottom * gid_1 : bottom * gid_0 >= bottom * gid_1) {
            // Directly calculate the inverse square root only when needed
            b[index_b] = CAST(rsqrt)(a[index_a]);
        }
    }
}