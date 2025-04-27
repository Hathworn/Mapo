#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float var_epsilon_inv = -.5f * powf(variance[i] + .000001f, -1.5f);  // Precompute common expression
    float vari_delta = 0;  // Use local variable to reduce global memory access

    for(int j = 0; j < batch; ++j){
        for(int k = 0; k < spatial; ++k){
            int index = j * filters * spatial + i * spatial + k;
            vari_delta += delta[index] * (x[index] - mean[i]);  // Accumulate variance delta contributions
        }
    }

    variance_delta[i] = vari_delta * var_epsilon_inv;  // Apply precomputed factor
}
```
