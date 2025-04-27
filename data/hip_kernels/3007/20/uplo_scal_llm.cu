#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {

#ifndef REAL
#define REAL float
#endif

__global__ void uplo_scal (const int sd, const int unit, const int bottom, const REAL alpha, REAL* a, const int offset_a, const int ld_a) {
    // Calculate global thread indices
    const int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    const int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;

    // Eliminate unnecessary bool checks and directly use conditions
    if (gid_0 < sd && gid_1 < sd && ((unit == 132) ? (bottom * gid_0 > bottom * gid_1) : (bottom * gid_0 >= bottom * gid_1))) {
        // Directly access and modify matrix elements
        a[offset_a + gid_0 + gid_1 * ld_a] *= alpha;
    }
}

}