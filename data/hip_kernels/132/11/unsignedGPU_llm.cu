#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void unsignedGPU(int numTests, unsigned* ns, unsigned* ds, unsigned* qs, unsigned* rs) {
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if thread index is within bounds
    if (idx < numTests) {
        unsigned n = ns[idx];
        unsigned d = ds[idx];

        qs[idx] = n / d;  // Compute quotient
        rs[idx] = n % d;  // Compute remainder
    }
}