#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if thread index is within bounds
    if(i < n) {
        float diff = truth[i] - pred[i];
        float abs_val = fabsf(diff);

        // Use ternary operator for compact conditional
        float abs_val_check = (abs_val < 1);
        error[i] = abs_val_check ? diff * diff : 2 * abs_val - 1;
        delta[i] = abs_val_check ? diff : (diff > 0) ? 1 : -1;
    }
}
```
