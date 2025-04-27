#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adagrad_update_1D_1D(float* x, float* d, float* m, float clip, float lr, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    // Use shared memory for faster access
    extern __shared__ float shared_d[];
    if (tid < size) shared_d[threadIdx.x] = d[tid];
    __syncthreads();

    for (; tid < size; tid += stride) {
        // Load data into registers for fast access
        float grad = shared_d[threadIdx.x];
        if (grad > clip) grad = clip;
        if (grad < -clip) grad = -clip;
        
        // Reduce global memory access by using local variable
        float momentum = m[tid] + grad * grad;
        m[tid] = momentum;

        float update = lr * grad / sqrtf(momentum + 1e-8f);
        x[tid] -= update;
        shared_d[threadIdx.x] = 0;  // Reset in shared memory
    }
}