#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kAssignScalar(float* dest, float alpha, unsigned int len) {
    // Calculate global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < len) {  // Ensure index is within bounds
        dest[idx] = alpha;  // Assign value
    }
}
```
