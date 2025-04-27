#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(int* D, int* Q, int bits) {
    // Compute the index using block and thread information
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform bit reversal using a more efficient approach
    int shifted_left = 0;
    for (int a = 0; a < bits; a++) {
        shifted_left |= (i & 1) << (bits - 1 - a);
        i >>= 1;
    }
    
    // Assign the values to the bit-reversed positions
    Q[shifted_left] = D[blockIdx.x * blockDim.x + threadIdx.x];
}