```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void  variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    // Calculate flattened thread index
    int i = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Initialize variance delta
    float temp_variance_delta = 0;

    // Loop unrolling for spatial data processing
    for(int j = 0; j < batch; ++j){
        int baseIdx = j * filters * spatial + i * spatial;
        for(int k = 0; k < spatial; k += 2){
            int index1 = baseIdx + k;
            int index2 = baseIdx + k + 1;
            
            temp_variance_delta += delta[index1] * (x[index1] - mean[i]);
            if (k + 1 < spatial) { // Check boundary for unrolled loop
                temp_variance_delta += delta[index2] * (x[index2] - mean[i]);
            }
        }
    }

    // Final calculation for variance delta
    variance_delta[i] = temp_variance_delta * -.5f * powf(variance[i] + .00001f, (float)(-3.f/2.f));
}