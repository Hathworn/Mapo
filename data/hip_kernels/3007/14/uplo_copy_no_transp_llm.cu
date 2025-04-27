#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {

#ifndef REAL
#define REAL float
#endif

}

__global__ void uplo_copy_no_transp(const int sd, const int unit, const int bottom, const REAL* __restrict__ a, const int offset_a, const int ld_a, REAL* __restrict__ b, const int offset_b, const int ld_b) {
    const int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    const int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;

    if (gid_0 < sd && gid_1 < sd) { // Check within boundaries
        if ((unit == 132 ? bottom * gid_0 > bottom * gid_1 : bottom * gid_0 >= bottom * gid_1)) { // Check condition
            const int ia = offset_a + gid_0 + gid_1 * ld_a; // Calculate input index
            const int ib = offset_b + gid_0 + gid_1 * ld_b; // Calculate output index
            b[ib] = a[ia]; // Perform the copy
        }
    }
}