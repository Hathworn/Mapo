#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {

#ifndef REAL
#define REAL float
#endif

__global__ void uplo_equals_transp (const int sd, const int unit, const int bottom, const REAL* a, const int offset_a, const int ld_a, const REAL* b, const int offset_b, const int ld_b, int* eq_flag) {
    const int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    const int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if indices are within bounds and perform necessary condition check.
    if (gid_0 < sd && gid_1 < sd && 
       ((unit == 132) ? bottom * gid_0 > bottom * gid_1 : bottom * gid_0 >= bottom * gid_1)) {
        const int ia = offset_a + gid_0 + gid_1 * ld_a;
        const int ib = offset_b + gid_1 + gid_0 * ld_b;

        // Atomic increment to ensure correct result with concurrent writes.
        if (a[ia] != b[ib]) {
            atomicAdd(eq_flag, 1);
        }
    }
}
}