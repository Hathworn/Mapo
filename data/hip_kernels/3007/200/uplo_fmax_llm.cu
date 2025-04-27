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

__global__ void uplo_fmax (const int sd, const int unit, const int bottom, const REAL* a, const int offset_a, const int ld_a, const REAL* b, const int offset_b, const int ld_b, REAL* c, const int offset_c, const int ld_c) {
    const int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    const int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;
    if (gid_0 >= sd || gid_1 >= sd) return; // Early exit for invalid threads

    bool is_valid = (unit == 132) ? bottom * gid_0 > bottom * gid_1 : bottom * gid_0 >= bottom * gid_1;
    
    if (is_valid) {
        int a_index = offset_a + gid_0 + gid_1 * ld_a;
        int b_index = offset_b + gid_0 + gid_1 * ld_b;
        int c_index = offset_c + gid_0 + gid_1 * ld_c;

        // Perform fmax and store the result in c
        c[c_index] = CAST(fmax)(a[a_index], b[b_index]);
    }
}
}