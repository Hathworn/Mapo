#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    int i = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= groups) return;
    
    // Use shared memory for faster access
    extern __shared__ float sharedSum[];
    sharedSum[threadIdx.x] = 0.0f;
    
    // Unroll the loop for better performance
    for(int k = threadIdx.x; k < n; k += blockDim.x){
        sharedSum[threadIdx.x] += x[k*groups + i];
    }
    
    // Use parallel reduction to sum up results
    __syncthreads();
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (threadIdx.x < s) {
            sharedSum[threadIdx.x] += sharedSum[threadIdx.x + s];
        }
        __syncthreads();
    }
    
    // Write result to global memory by the first thread in the block
    if (threadIdx.x == 0) {
        sum[i] = sharedSum[0];
    }
}