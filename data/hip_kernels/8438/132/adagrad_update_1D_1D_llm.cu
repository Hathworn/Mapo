#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adagrad_update_1D_1D(float* x, float* d, float* m, float clip, float lr, int size) {
    // Calculate the thread ID and stride
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Use shared memory for frequently accessed variables
    extern __shared__ float shared_memory[];

    for (; tid < size; tid += stride) {
        float d_val = d[tid];
        
        // Clip gradient
        if (d_val > clip) d_val = clip;
        if (d_val < -clip) d_val = -clip;
    
        float m_val = m[tid] + d_val * d_val;

        // Update weight
        x[tid] -= lr * d_val / sqrt(m_val + 1e-8);

        // Zero out the gradient
        d[tid] = 0;

        // Update shared memory
        shared_memory[threadIdx.x] = m_val;
        
        // Synchronize threads
        __syncthreads();

        // Write back to global memory
        m[tid] = shared_memory[threadIdx.x];
    }
}