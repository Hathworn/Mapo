#include "hip/hip_runtime.h"
#include "includes.h"

// Utilize shared memory to improve state initialization
__global__ void render_init(int mx, int my, hiprandState *randState, int seed) {
    extern __shared__ char shared_mem[]; // Shared memory allocation
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int j = threadIdx.y + blockIdx.y * blockDim.y;
    
    // Check bounds within shared memory initialization
    if (i < mx && j < my) {
        int pixel_index = j * mx + i;
        // Initialize each thread with its unique seed
        hiprand_init(seed, pixel_index, 0, &randState[pixel_index]);
    }
}
```
