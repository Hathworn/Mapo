#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {

#ifndef REAL
#define REAL float
#endif

}

__global__ void ge_swap_transp(const int sd, const int fd, REAL* a, const int offset_a, const int ld_a, REAL* b, const int offset_b, const int ld_b) {
    // Calculate global indices
    const int gid_0 = blockIdx.x * blockDim.x + threadIdx.x;
    const int gid_1 = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Check if indices are within bounds
    if (gid_0 < sd && gid_1 < fd) {
        // Calculate linear indices for matrices `a` and `b`
        const int ia = offset_a + gid_0 + gid_1 * ld_a;
        const int ib = offset_b + gid_1 + gid_0 * ld_b;
        
        // Perform the transposition and swap
        REAL c = b[ib]; // Load from b
        b[ib] = a[ia];  // Store to b
        a[ia] = c;      // Store to a
    }
}