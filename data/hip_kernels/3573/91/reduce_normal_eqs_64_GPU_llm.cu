#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduce_normal_eqs_64_GPU(float *d_C_reduced, float *d_C, int gridDim_x_normal_equations) {

    int tid = threadIdx.x;
    int bx = blockIdx.x;

    // put data in shared memory
    int ind = blockIdx.y * gridDim.x * gridDim_x_normal_equations * 64 +
              bx * gridDim_x_normal_equations * 64 + tid;

    __shared__ float DATA[64];

    // load and sum the first 20 elements
    float tmp = 0.0f;
    for (int i = 0; i < gridDim_x_normal_equations; i++)
        tmp += d_C[ind + i * 64];
    DATA[tid] = tmp;

    __syncthreads(); // ensure reading stage has finished

    // optimized reduction using warp shuffle instructions
    for (int stride = 32; stride > 0; stride /= 2) {
        tmp += __shfl_down_sync(0xFFFFFFFF, tmp, stride);
    }
    
    // write results
    if (tid == 0) {
        d_C_reduced[blockIdx.y * gridDim.x + bx] = tmp;
    }
}