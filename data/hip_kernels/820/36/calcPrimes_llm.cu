#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void calcPrimes(int *d_IL, int *d_PL, int numOfPrimes, int lenInputList) {
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    if(index < numOfPrimes) {
        int prime = d_PL[index];  // Load prime value once from global memory
        for(int i = prime * prime; i < lenInputList; i += prime) {  // Start from square of prime, increment by prime
            if(d_IL[i] != 0) {  // Avoid redundant zeroing
                d_IL[i] = 0;
            }
        }
    }
}