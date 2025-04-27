#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel with better usage of shared memory
__global__ void make_bins(float *vec, int *bin, const int num_bins, const int n, const float slope, const float intercept)
{
    unsigned int xIndex = blockDim.x * blockIdx.x + threadIdx.x;

    if (xIndex < n) {
        // Load vec value to shared memory (reduce global memory access)
        __shared__ float shared_vec[BLOCK_SIZE];
        shared_vec[threadIdx.x] = vec[xIndex];
        __syncthreads();

        float temp = abs(shared_vec[threadIdx.x]);
        
        if (temp > (intercept * 0.000001)) {
            bin[xIndex] = slope * (intercept - temp);
        } else {
            bin[xIndex] = num_bins;
        }
    }
}