#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void trapz_kernel(float* y, float* x, float* auc, int num_selected) {
    // Use shared memory to reduce atomic operations on global memory
    __shared__ float s_auc_local[256]; // Adjust size based on blockDim.x
    int tid = threadIdx.x;
    s_auc_local[tid] = 0.0f;
    __syncthreads();

    int gid_base = blockIdx.x * blockDim.x + threadIdx.x;
    for (int gid = gid_base; gid < num_selected - 1; gid += blockDim.x * gridDim.x) {
        float a = x[gid];
        float b = x[gid + 1];
        float fa = y[gid];
        float fb = y[gid + 1];
        float area = (b - a) * (fa + fb) / 2.0f;
        if (gid == 0) {
            area += (a * fa / 2.0f);
        }
        // Accumulate area in shared memory
        s_auc_local[tid] += area;
    }
    __syncthreads();

    // Reduce within block and write result to global memory
    if (tid == 0) {
        float block_sum = 0.0f;
        for (int i = 0; i < blockDim.x; i++) {
            block_sum += s_auc_local[i];
        }
        atomicAdd(auc, block_sum);
    }
}