#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    // Thread index calculation
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    float scale = 1.f / (batch * spatial);

    // Ensure thread processes within bounds
    if (tid < filters) {
        float sum = 0.0f;

        // Unroll inner loops for coalesced memory access
        for (int j = 0; j < batch; ++j) {
            for (int k = 0; k < spatial; ++k) {
                int index = j * filters * spatial + tid * spatial + k;
                sum += x[index];
            }
        }
        
        mean[tid] = sum * scale;  // Store scaled mean result
    }
}