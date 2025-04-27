#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    // Calculate global thread index
    int f = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    
    // Ensure the thread operates on a valid element
    if (f >= n) return;

    // Use shared memory to reduce global memory accesses for mean calculation
    extern __shared__ float shared_weights[];
    float mean = 0.0f;

    // Each thread sums up its portion of the weights into shared memory
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        shared_weights[threadIdx.x] = fabsf(weights[f * size + i]);
        __syncthreads();

        // Perform reduction to calculate mean
        for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
            if (threadIdx.x < offset) {
                shared_weights[threadIdx.x] += shared_weights[threadIdx.x + offset];
            }
            __syncthreads();
        }

        // Calculate mean from reduced sum at the first thread
        if (threadIdx.x == 0) {
            mean = shared_weights[0] / size;
        }
        __syncthreads();
    }
    
    // Apply thresholding to binarize the weights
    for(int i = threadIdx.x; i < size; i += blockDim.x) {
        binary[f * size + i] = (weights[f * size + i] > 0) ? mean : -mean;
    }
}