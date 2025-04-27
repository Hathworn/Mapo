#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_square_grad(float* in_x, float* in_d, float* out_x, float* out_d, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Use shared memory for coalesced access, increases data access speed
    extern __shared__ float shared_out_d[];

    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        shared_out_d[i] = out_d[i];
    }
    __syncthreads();

    for (; tid < size; tid += stride) {
        // Ensure tid < size is checked once outside
        in_d[tid] += shared_out_d[tid] * 2.0f * in_x[tid];
    }
}