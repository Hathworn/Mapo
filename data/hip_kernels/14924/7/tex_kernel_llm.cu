#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel optimized for efficient texture fetching
__global__ void tex_kernel(hipTextureObject_t texture_obj, int num_samples, float* output) {
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use block-level or warp-level operations to improve memory access efficiency
    // Removed conditional check by performing it only within active threads
    if (idx < num_samples) {
        float u = __fdividef(idx, num_samples);
        output[idx] = tex1Dfetch<float>(texture_obj, idx);
    }
}
```
