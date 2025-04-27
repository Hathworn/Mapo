#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sieveOfEratosthenesCUDA(char *primes, uint64_t max) {
    // Optimize by reducing thread divergence
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    const uint64_t maxRoot = sqrt((double)max);

    if (index == 0) {
        primes[0] = 1; // 0 is not prime
        primes[1] = 1; // 1 is not prime
        // mark multiples of 2
        for (int j = 2 * 2; j < max; j += 2) {
            primes[j] = 1;
        }
        return; // exit for index 0 after initialization
    }

    if (index < maxRoot && primes[index] == 0 && index > 1) {
        // mark off composite numbers
        for (int j = index * index; j < max; j += index) {
            primes[j] = 1;
        }
    }
}