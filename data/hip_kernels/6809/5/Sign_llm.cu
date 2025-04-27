#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Sign(float *x, size_t idx, size_t N)
{
    // Calculate the global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a while loop instead of for-loop for better readability
    while (i < N)
    {
        // Use ternary operator for compact conditional assignment
        float res = x[(idx - 1) * N + i];
        x[(idx - 1) * N + i] = (res > 0) ? 1.0 : (res == 0) ? 0.0 : -1.0;

        // Increment by the total number of threads
        i += blockDim.x * gridDim.x;
    }
}
```
