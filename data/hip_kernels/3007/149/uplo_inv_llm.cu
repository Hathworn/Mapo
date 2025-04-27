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

__global__ void uplo_inv (const int sd, const int unit, const int bottom, const REAL* __restrict__ a, const int offset_a, const int ld_a, REAL* __restrict__ b, const int offset_b, const int ld_b) {
    const int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    const int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;
    if (gid_0 < sd && gid_1 < sd) {  // Inline validity check for efficiency
        const int index_a = offset_a + gid_0 + gid_1 * ld_a;  // Compute a index once
        const int index_b = offset_b + gid_0 + gid_1 * ld_b;  // Compute b index once
        // Pre-calculate multiplication to avoid repetitive calculations
        const int comp_g0_g1 = bottom * gid_0;
        const int comp_g1_g0 = bottom * gid_1;
        if ((unit == 132 ? comp_g0_g1 > comp_g1_g0 : comp_g0_g1 >= comp_g1_g0)) {
            b[index_b] = (REAL)1.0 / a[index_a];  // Perform division
        }
    }
}