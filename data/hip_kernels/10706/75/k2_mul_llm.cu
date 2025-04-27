#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void k2_mul(float *data, float val) {
    // Calculate global index to allow for flexible grid configuration
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure threads don't access out-of-bound memory
    if (idx < N) {
        data[idx] *= val;
    }
}
```
Please ensure to define `N` before using this code, it should represent the total number of elements in the `data` array.