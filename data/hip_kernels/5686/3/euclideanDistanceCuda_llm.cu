#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void euclideanDistanceCuda(float3* pDotProducts, size_t pSize, float* results) {
    int instance = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for cooperative fetching and reduced global memory access
    __shared__ float3 sharedDotProducts[1024]; // Adjust based on block size if needed

    while (instance < pSize) {
        sharedDotProducts[threadIdx.x] = pDotProducts[instance]; // Load into shared memory
        __syncthreads(); // Ensure all threads have loaded their data

        // Calculate result using fetched data
        float result = sharedDotProducts[threadIdx.x].x - 2 * sharedDotProducts[threadIdx.x].y + 
                        sharedDotProducts[threadIdx.x].z;
        
        // Single step for non-negativity constraint check
        results[instance] = fmaxf(result, 0.0f);

        // Increment by total number of threads
        instance += gridDim.x * blockDim.x;
        __syncthreads(); // Ensure all processing is complete before next iteration
    }
}