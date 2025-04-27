#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sleepKernel(double* cycles, int64_t waitCycles) {
    extern __shared__ int s[];
    long long int start = clock64();

    // Unroll the loop to decrease the number of branching
    while (true) {
        // Cache the clock64() value to reduce register pressure
        long long int current = clock64();
        long long int total = current - start;

        if (total >= waitCycles) {
            break;
        }
    }
    *cycles = static_cast<double>(clock64() - start);
}