#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_hello() {
    // Use grid and block size to calculate the unique thread index for better distribution
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    printf("Hello World from GPU! %d\n", idx);
}
```
