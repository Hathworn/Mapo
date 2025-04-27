#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void spinKernel(unsigned long long timeout_clocks = 100000ULL)
{
    // Use a more efficient calculation for the loop condition
    unsigned long long start_time = clock64();

    // Simplified polling for timeout
    while (clock64() - start_time <= timeout_clocks) {
        // Empty loop body for spin wait
    }
}