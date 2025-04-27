#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void assisted_activation2_kernel(float alpha, float *output, float *gt_gpu, float *a_avg_gpu, int size, int channels, int batches)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Derive batch and spatial position
    int xy = i % size;
    int b = i / size;
    float beta = 1 - alpha;

    // Check if current batch is valid
    if (b < batches) {
        // Use shared memory if possible for reduction in global memory accesses
        __shared__ float shared_output[BLOCK_SIZE];
        
        // Iterate over channels
        for (int c = 0; c < channels; ++c) {
            if (gt_gpu[i] == 0)
                shared_output[threadIdx.x] = output[xy + size*(c + channels*b)] * beta;
        }
        
        // Sync threads before writing back to global memory
        __syncthreads();
        
        // Write processed values back to output
        for (int c = 0; c < channels; ++c) {
            output[xy + size*(c + channels*b)] = shared_output[threadIdx.x];
        }
    }
}
```
