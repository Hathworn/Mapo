#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel using shared memory
__global__ void reduce_to_first_index_h(float *X, int height, int width) {
    extern __shared__ float shared_data[];
    int t = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Load data into shared memory
    if (t < width) {
        shared_data[threadIdx.x] = 0;
        for (int i = 0; i < height; i++) {
            shared_data[threadIdx.x] += X[i * width + t];
        }
        
        // Synchronize threads before writing back
        __syncthreads();

        // Write back the result to global memory
        if (threadIdx.x == 0) {
            for (int j = 1; j < blockDim.x; j++) {
                shared_data[0] += shared_data[j];
            }
            X[t] = shared_data[0];
        }
    }
}