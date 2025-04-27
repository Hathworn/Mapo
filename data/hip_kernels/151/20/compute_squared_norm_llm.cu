#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void compute_squared_norm(float * array, int width, int pitch, int height, float * norm){
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (xIndex < width) {
        float sum = 0.f;
        // Use shared memory to reduce global memory access
        extern __shared__ float shared_array[];
        
        for (int i = threadIdx.y; i < height; i += blockDim.y) {
            shared_array[threadIdx.y] = array[i * pitch + xIndex];
            __syncthreads();  // Synchronize to ensure all threads have loaded their data
            
            float val = shared_array[threadIdx.y];
            sum += val * val;
            __syncthreads();  // Synchronize for safe shared memory reuse
        }
        
        // Reduce within a warp (assume blockDim.x is warpSize)
        for (int offset = warpSize / 2; offset > 0; offset >>= 1) {
            sum += __shfl_down_sync(0xffffffff, sum, offset);
        }
        
        // Write the result for each warp's leader
        if ((threadIdx.y & (warpSize - 1)) == 0) {
            atomicAdd(&norm[xIndex], sum);
        }
    }
}