```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Use shared memory for frequently accessed data
    extern __shared__ float shared_mem[];
    if (threadIdx.x < n) {
        shared_mem[threadIdx.x] = dc[threadIdx.x];
        __syncthreads(); // Ensure all threads have loaded data
    }
    
    if (i < n) {
        float dc_val = shared_mem[i % blockDim.x]; // Use shared memory data
        float si = s[i];
        
        if (da) da[i] += dc_val * si; // Update da using shared value
        db[i] += dc_val * (1 - si); // Update db using shared value
        ds[i] += dc_val * a[i] - dc_val * b[i]; // Update ds using shared value
    }
}