#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void logistic_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds
    if (i < n) {
        float t = truth[i];
        float p = pred[i];

        // Compute error
        error[i] = -t * logf(p + 1e-7f) - (1 - t) * logf(1 - p + 1e-7f);

        // Compute delta
        delta[i] = t - p;
    }
}
```
