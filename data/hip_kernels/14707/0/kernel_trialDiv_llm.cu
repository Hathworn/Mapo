#include "hip/hip_runtime.h"
#include "includes.h"

// Assertion to check for errors
__global__ void kernel_trialDiv(long* n, int* r) {
    int bx = blockIdx.x;  // ID thread
    int tx = threadIdx.x;

    // Identify the row and column of the Pd element to work on
    long memIndex = bx * TILE_WIDTH + tx;
    long n_value = n[memIndex];  // Load data to a register

    // Unrolling the loop for better performance
    #pragma unroll
    for (int i = 0; i < 256; i++) {
        if (n_value % d_sPrimes[i] == 0) {
            r[memIndex]--;  // Efficient decrement
        }
    }
}