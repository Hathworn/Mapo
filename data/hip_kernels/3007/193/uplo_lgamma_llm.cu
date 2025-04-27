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

__global__ void uplo_lgamma (const int sd, const int unit, const int bottom, const REAL* a, const int offset_a, const int ld_a, REAL* b, const int offset_b, const int ld_b) {
    const int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;  // Global index for x
    const int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;  // Global index for y

    if (gid_0 < sd && gid_1 < sd) {  // Validate global index
        if ((unit == 132 ? bottom * gid_0 > bottom * gid_1 : bottom * gid_0 >= bottom * gid_1)) {  // Condition check
            int index_a = offset_a + gid_0 + gid_1 * ld_a;  // Calculate index for a
            int index_b = offset_b + gid_0 + gid_1 * ld_b;  // Calculate index for b
            b[index_b] = CAST(lgamma)(a[index_a]);  // Compute and assign
        }
    }
}

}