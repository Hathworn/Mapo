#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {

#ifndef REAL
#define REAL float
#endif

}

__global__ void uplo_axpby_no_transp (const int sd, const int unit, const int bottom, const REAL alpha, const REAL* __restrict__ a, const int offset_a, const int ld_a, const REAL beta, REAL* __restrict__ b, const int offset_b, const int ld_b) {
    // Calculate global indices for the current thread
    const int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    const int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;

    // Validate indices and condition for processing
    if ((gid_0 < sd) && (gid_1 < sd) && 
        ((unit == 132) ? bottom * gid_0 > bottom * gid_1 : bottom * gid_0 >= bottom * gid_1)) {

        // Compute indices for accessing arrays
        const int ia = offset_a + gid_0 + gid_1 * ld_a;
        const int ib = offset_b + gid_0 + gid_1 * ld_b;

        // Perform the axpby operation
        b[ib] = alpha * a[ia] + beta * b[ib];
    }
}