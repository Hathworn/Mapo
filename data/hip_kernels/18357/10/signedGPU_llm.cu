#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void signedGPU(int numTests, int* ns, int* ds, int* qs, int* rs) {
    // Get global thread index for optimized access
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check index to prevent out-of-bounds access
    if (i < numTests) {
        int n = ns[i];
        int d = ds[i];

        // Perform division and modulus operations
        qs[i] = n / d;
        rs[i] = n % d;
    }
}
```
