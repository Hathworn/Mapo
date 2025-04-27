#include "hip/hip_runtime.h"
#include "includes.h"
#define L2HYS_EPSILON       0.01f
#define L2HYS_EPSILONHYS    1.0f
#define L2HYS_CLIP          0.2f
#define data_h2y            30

__global__ void smoothcell(float *in, float *out) {
    int t_nleft = (threadIdx.x + 9) % 10; // Optimize modulo calculation
    int t_nright = (threadIdx.x + 1) % 10; // Simplify right neighbor calculation
    float *t_ptemp = in + blockIdx.x * 70 + blockIdx.y * 10;
    
    // Precompute and store values in shared memory
    __shared__ float shared_temp[10];
    shared_temp[threadIdx.x] = t_ptemp[threadIdx.x];
    __syncthreads();

    // Apply smoothing filter
    t_ptemp[threadIdx.x] = shared_temp[threadIdx.x] * 0.8f 
                         + 0.1f * shared_temp[t_nleft] 
                         + 0.1f * shared_temp[t_nright];
    __syncthreads();
    
    // Write output
    out[blockIdx.x * 70 + blockIdx.y * 10 + threadIdx.x] = t_ptemp[threadIdx.x];
    __syncthreads();
}