#include "hip/hip_runtime.h"
#include "includes.h"

// Improved assisted_activation_kernel function.
__global__ void assisted_activation_kernel(float alpha, float *output, float *gt_gpu, float *a_avg_gpu, int size, int channels, int batches)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int b = i / size;

    // Process only valid batches.
    if (b < batches) {
        int xy = i % size;
        
        // Precompute index outside the loop to save redundant calculations.
        int index_base = size * channels * b + xy;

        // Optimize loop by reducing array access computation.
        for (int c = 0; c < channels; ++c) {
            int output_index = index_base + size * c;
            
            // Use atomic operations to safely update output in parallel.
            atomicAdd(&output[output_index], alpha * gt_gpu[i] * a_avg_gpu[i]);
        }
    }
}