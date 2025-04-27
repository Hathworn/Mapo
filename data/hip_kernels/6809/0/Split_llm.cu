#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Split(float * xf, bool * xb, size_t idxf, size_t idxb, size_t N, float threshold)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure thread does not exceed N
    if (i < N)
    {
        // Perform threshold check and assignment
        xb[(idxb) * N + i] = (xf[(idxf - 1) * N + i] < threshold);
    }
}
```
