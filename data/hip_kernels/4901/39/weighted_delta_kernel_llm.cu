#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_delta_kernel(int n, float *a, float *b, float *s, float *da, float *db, float *ds, float *dc)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation assuming 1D grid
    if(i < n){
        // Use shared memory for reused values
        __shared__ float shared_a, shared_b, shared_s, shared_dc;
        if (threadIdx.x == 0) {
            shared_a = a[blockIdx.x * blockDim.x];  // load block-specific value
            shared_b = b[blockIdx.x * blockDim.x];  // load block-specific value
            shared_s = s[blockIdx.x * blockDim.x];  // load block-specific value
            shared_dc = dc[blockIdx.x * blockDim.x];  // load block-specific value
        }
        __syncthreads();  // Synchronize threads within block

        // Perform operations using shared memory values
        if(da) da[i] += shared_dc * shared_s;
        db[i] += shared_dc * (1 - shared_s);
        ds[i] += shared_dc * shared_a + shared_dc * -shared_b;
    }
}