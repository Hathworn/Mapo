#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void max_min_cuda(float *d_in1, float *d_in2, float *d_max, float *d_min, size_t nb)
{
    extern __shared__ float shared_data[];
    float* s_in1 = shared_data;
    float* s_in2 = shared_data + blockDim.x;

    int ft_id = threadIdx.x + blockDim.x * blockIdx.x;
    int tid = threadIdx.x;

    // Load input into shared memory
    if (ft_id < nb) {
        s_in1[tid] = d_in1[ft_id];
        s_in2[tid] = d_in2[ft_id];
    }
    else {
        s_in1[tid] = -FLT_MAX;
        s_in2[tid] = FLT_MAX;
    }
    __syncthreads();

    // Perform reduction in shared memory
    for (size_t s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s && tid + s < blockDim.x) {
            s_in1[tid] = fmaxf(s_in1[tid], s_in1[tid + s]);
            s_in2[tid] = fminf(s_in2[tid], s_in2[tid + s]);
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) {
        d_max[blockIdx.x] = s_in1[0];
        d_min[blockIdx.x] = s_in2[0];
    }
}