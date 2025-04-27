#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel2(int N, int *d_array) {
    // Use thread index to avoid sequential access
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < N) {
        d_array[i] = i;
    }
}
```
