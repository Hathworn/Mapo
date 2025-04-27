#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    // Calculate global index
    int s = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    
    // Early exit if the index is out of bounds
    if (s >= size) return;

    // Use shared memory to store the mean
    __shared__ float sharedMean;
    
    // Calculate mean using parallel reduction
    float localMean = 0;
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        localMean += fabsf(input[i * size + s]);
    }
    
    // Sum local mean values into shared memory
    atomicAdd(&sharedMean, localMean / n);
    __syncthreads();
    
    // Binarize input using the mean from shared memory
    for (int i = 0; i < n; ++i) {
        binary[i * size + s] = (input[i * size + s] > 0) ? sharedMean : -sharedMean;
    }
}