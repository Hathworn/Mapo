#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduce_normal_eqs_64_GPU(float *d_C_reduced, float *d_C, int gridDim_x_normal_equations) {
    int tid = threadIdx.x;
    int bx = blockIdx.x;
    int ind = blockIdx.y * gridDim.x * gridDim_x_normal_equations * 64 +
              bx * gridDim_x_normal_equations * 64 + tid;

    __shared__ float DATA[64];

    // load and sum the first 20 elements
    float tmp = 0.0f;
    for (int i = 0; i < gridDim_x_normal_equations; i++)
        tmp += d_C[ind + i * 64];
    DATA[tid] = tmp;

    __syncthreads(); // ensure reading stage has finished

    // optimize using warp-shuffle for reduction
    for (int offset = 32; offset > 0; offset /= 2) {
        tmp += __shfl_down_sync(0xFFFFFFFF, tmp, offset);
    }

    // write results
    if (tid == 0)
        d_C_reduced[blockIdx.y * gridDim.x + bx] = tmp;
}