#include "hip/hip_runtime.h"
#include "includes.h"
__global__ static void sieveOfEratosthenes(char *primes, uint64_t max) {
    // Optimize for loop conditions and access patterns
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index == 0 && threadIdx.y == 0) {
        primes[0] = 1; // 0 is not prime
        primes[1] = 1; // 1 is not prime
        // Sieve multiples of two
        for (uint64_t j = 4; j < max; j += 2) {
            primes[j] = 1;
        }
        return;
    }

    const uint64_t maxRoot = sqrt((double)max);
    if (index <= maxRoot && index > 1 && primes[index] == 0) {
        // Mark off composite numbers
        for (uint64_t j = index * index; j < max; j += index) {
            primes[j] = 1;
        }
    }
}