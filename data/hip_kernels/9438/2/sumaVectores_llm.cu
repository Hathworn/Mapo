#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumaVectores (float * d_a, float *d_b, float * d_c, int n) {
    // Calculate the global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Check bounds to avoid extra threads computation
    if (index < n) {
        d_c[index] = d_a[index] + d_b[index];
    }
}
```
