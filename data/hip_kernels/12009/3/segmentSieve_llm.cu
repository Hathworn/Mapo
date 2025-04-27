#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void segmentSieve(char *primes, uint64_t max) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory for efficient data access
    extern __shared__ char shared_primes[];

    if (index > 0) {
        const uint64_t maxRoot = sqrt((double)max);
        int low = maxRoot * index;
        int high = low + maxRoot;
        if (high > max) high = max;
        
        // Initialize shared memory
        for (int i = threadIdx.x; i < maxRoot; i += blockDim.x) {
            shared_primes[i] = primes[i];
        }
        __syncthreads();

        for (int i = 2; i < maxRoot; i++) {
            if (shared_primes[i] == 0) { // Access shared memory
                int loLim = (low / i) * i;
                if (loLim < low)
                    loLim += i;
                for (int j = loLim; j < high; j += i)
                    primes[j] = 1;
            }
        }
    }
}