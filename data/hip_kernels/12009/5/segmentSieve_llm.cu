#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void segmentSieve(char *primes, uint64_t max) {
    // Simplified index calculation
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if(index > 0) {
        const uint64_t maxRoot = sqrt((double)max);
        // Calculate low and high efficiently
        uint64_t low = maxRoot * index;
        uint64_t high = min(low + maxRoot, max);

        // Use shared memory for maxRoot primes
        __shared__ char sharedPrimes[1024]; // Adjust size as needed
        if (threadIdx.x < maxRoot) {
            sharedPrimes[threadIdx.x] = primes[threadIdx.x];
        }
        __syncthreads();

        for (uint64_t i = 2; i < maxRoot; i++) {
            if(sharedPrimes[i] == 0) { // Use shared memory
                // Calculate the loLim more accurately
                uint64_t loLim = max(low / i * i, (uint64_t)i * i);
                if (loLim < low)
                    loLim += i;

                // Unroll the loop for efficiency
                for (uint64_t j = loLim; j < high; j += i) {
                    primes[j] = 1;
                }
            }
        }
    }
}