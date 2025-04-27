#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {

#ifndef REAL
#define REAL float
#endif

}

__global__ void uplo_axpby_transp (const int sd, const int unit, const int bottom, const REAL alpha, const REAL* a, const int offset_a, const int ld_a, const REAL beta, REAL* b, const int offset_b, const int ld_b) {
    const int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    const int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;

    // Prefetch condition results to reduce redundant calculations
    const bool valid_gid_0 = gid_0 < sd;
    const bool valid_gid_1 = gid_1 < sd;
    const bool valid = valid_gid_0 && valid_gid_1;
    const bool check = valid && (unit == 132 ? bottom * gid_0 > bottom * gid_1 : bottom * gid_0 >= bottom * gid_1);

    if (check) {
        const int ia = offset_a + gid_0 + gid_1 * ld_a;
        const int ib = offset_b + gid_1 + gid_0 * ld_b;
        // Use registers for temporary variables to optimize memory access
        const REAL a_val = a[ia];
        const REAL b_val = b[ib];
        b[ib] = alpha * a_val + beta * b_val;
    }
}