#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {

#ifndef REAL
#define REAL float
#endif

}

__global__ void uplo_copy_transp(const int sd, const int unit, const int bottom, const REAL* a, const int offset_a, const int ld_a, REAL* b, const int offset_b, const int ld_b) {
    // Using shared memory to minimize global memory accesses
    __shared__ REAL tile[32][32+1]; // +1 to avoid bank conflicts

    int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;

    if (gid_0 < sd && gid_1 < sd) {
        tile[threadIdx.y][threadIdx.x] = a[offset_a + gid_0 + gid_1 * ld_a];
    }
    __syncthreads();

    gid_0 = blockIdx.y * blockDim.y + threadIdx.x;
    gid_1 = blockIdx.x * blockDim.x + threadIdx.y;

    if (gid_0 < sd && gid_1 < sd) {
        bool check = (unit == 132) ? bottom * gid_1 > bottom * gid_0 : bottom * gid_1 >= bottom * gid_0;
        if (check) {
            b[offset_b + gid_1 + gid_0 * ld_b] = tile[threadIdx.x][threadIdx.y];
        }
    }
}