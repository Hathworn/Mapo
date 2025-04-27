#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void signedGPU(int numTests, int* ns, int* ds, int* qs, int* rs) {
    // Parallelize computation using block and thread indices
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if idx is within bounds to avoid out-of-bounds access
    if (idx < numTests) {
        int n = ns[idx];
        int d = ds[idx];

        qs[idx] = n / d;
        rs[idx] = n % d;
    }
}