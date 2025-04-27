#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void unsignedGPU(int numTests, unsigned* ns, unsigned* ds, unsigned* qs, unsigned* rs) {
    // Use thread index to allow parallel execution
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < numTests) { // Ensure valid index range
        unsigned n = ns[i];
        unsigned d = ds[i];

        qs[i] = n / d;
        rs[i] = n % d;
    }
}