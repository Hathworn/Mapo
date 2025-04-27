#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void assisted_activation_kernel(float alpha, float *output, float *gt_gpu, float *a_avg_gpu, int size, int channels, int batches)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for caching repeated calculations
    extern __shared__ float shared_data[];
    float *shared_gt_gpu = shared_data;
    float *shared_a_avg_gpu = shared_data + blockDim.x;

    if (i < size * batches) {  // Ensure valid index access
        int xy = i % size;
        int b = i / size;

        shared_gt_gpu[threadIdx.x] = gt_gpu[i];  // Load data into shared memory
        shared_a_avg_gpu[threadIdx.x] = a_avg_gpu[i];

        __syncthreads();  // Synchronize threads to ensure memory is loaded

        if (b < batches) {
            for (int c = 0; c < channels; ++c) {
                int idx = xy + size * (c + channels * b);
                output[idx] += alpha * shared_gt_gpu[threadIdx.x] * shared_a_avg_gpu[threadIdx.x];
            }
        }
    }
}