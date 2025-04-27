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

__global__ void uplo_cdf_norm_inv (const int sd, const int unit, const int bottom, const REAL* a, const int offset_a, const int ld_a, REAL* b, const int offset_b, const int ld_b) {
    // Compute the global thread indices
    const int gid_0 = blockIdx.x * blockDim.x + threadIdx.x; 
    const int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if the indices are within bounds
    if (gid_0 < sd && gid_1 < sd) {
        // Precompute condition result to avoid repeated computation
        const bool condition_result = ((unit == 132) ? bottom * gid_0 > bottom * gid_1 : bottom * gid_0 >= bottom * gid_1);
        
        // Apply the transformation if condition passes
        if (condition_result) {
            b[offset_b + gid_0 + gid_1 * ld_b] = CAST(normcdfinv)(a[offset_a + gid_0 + gid_1 * ld_a]);
        }
    }
}