#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_normal_kernel(int seed, float *data, int n, float mean, float std) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x; // Calculate global thread index
    if (idx >= n) return; // Exit if thread index is out of data range

    hiprandState state;
    hiprand_init(seed, idx, 0, &state); // Use unique seed per thread

    // Each thread processes one element based on its index
    data[idx] += hiprand_normal(&state) * std + mean;
}
```
