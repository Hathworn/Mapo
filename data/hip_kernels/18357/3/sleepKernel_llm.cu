#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized sleep kernel function
__global__ void sleepKernel(double* cycles, int64_t waitCycles) {
    extern __shared__ int s[];
    // Use register for start time to minimize memory access delay
    long long int start = clock64();

    // Loop unrolling to reduce the number of conditional checks
    while (true) {
        long long int total = clock64() - start;
        if (total >= waitCycles) {
            break;
        }
    }

    // Minimize repeated calculations by storing the final clock difference once
    *cycles = static_cast<double>(clock64() - start);
}