#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {

#ifndef REAL
#define REAL float
#endif

__global__ void ge_swap_no_transp (const int sd, const int fd, REAL* a, const int offset_a, const int ld_a, REAL* b, const int offset_b, const int ld_b) {
    // Optimize by calculating indices only once
    const int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    const int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;
    if (gid_0 < sd && gid_1 < fd) {
        const int index_a = offset_a + gid_0 + gid_1 * ld_a;
        const int index_b = offset_b + gid_0 + gid_1 * ld_b;
        const REAL temp = b[index_b];
        b[index_b] = a[index_a];
        a[index_a] = temp;
    }
}

}