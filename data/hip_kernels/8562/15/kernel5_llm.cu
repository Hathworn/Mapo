#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel5(int *a, int dimx, int dimy) {
    // Compute a unique global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;

    // Boundary check to ensure we are within the valid range
    if (idx < dimx && idy < dimy) {
        // Calculate the linear index for this element
        int index = idy * dimx + idx;
        
        // Example operation on the array element (for demonstration)
        a[index] *= 2; // This operation can be replaced with actual computation
    }
}