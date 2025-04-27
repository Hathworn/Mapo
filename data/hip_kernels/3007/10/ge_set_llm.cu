#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {

#ifndef REAL
#define REAL float
#endif

}

__global__ void ge_set(const int sd, const int fd, const REAL val, REAL* a, const int offset_a, const int ld_a) {
    // Calculate global thread ID for 1D flattened grid
    int gid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Calculate offsets in 2D grid
    int gid_x = gid % sd;
    int gid_y = gid / sd;
    
    // Check if global thread coordinates are within matrix bounds
    if (gid_x < sd && gid_y < fd) {
        // Set the value in the matrix at calculated position
        a[offset_a + gid_x + gid_y * ld_a] = val;
    }
}