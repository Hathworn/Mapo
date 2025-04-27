#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void sieveOfEratosthenesCUDA(char* primes, uint64_t max) {

    // First thread handles multiples of two
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        primes[0] = 1; // 0 is not prime
        primes[1] = 1; // 1 is not prime
        
        // Mark multiples of two as non-prime
        for (int j = 4; j < max; j += 2) {
            primes[j] = 1;
        }
    } else {
        int index = blockIdx.x * blockDim.x + threadIdx.x;
        const uint64_t maxRoot = sqrt((double)max);
        
        // Avoid out of bounds, and skip index 1
        if (index <= maxRoot && index > 1 && primes[index] == 0) {
            // Mark off composite numbers
            for (int j = index * index; j < max; j += index) {
                primes[j] = 1;
            }
        }
    }
}