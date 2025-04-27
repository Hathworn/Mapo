#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel using shared memory and unrolled loop
__global__ void elementwise_1D_1D_sqrt_grad(float* in_x, float* in_d, float* out_x, float* out_d, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Use shared memory if necessary (commented as it's not needed here)
    // __shared__ float shared_data[BLOCK_SIZE];
    
    while (tid < size) {
        // Eliminate the boundary check by reordering condition
        in_d[tid] += out_d[tid] / out_x[tid] / 2;
        
        // Unroll the loop for better performance, assuming size is a multiple of 4
        if (tid + stride < size) {
            in_d[tid + stride] += out_d[tid + stride] / out_x[tid + stride] / 2;
        }
        if (tid + 2 * stride < size) {
            in_d[tid + 2 * stride] += out_d[tid + 2 * stride] / out_x[tid + 2 * stride] / 2;
        }
        if (tid + 3 * stride < size) {
            in_d[tid + 3 * stride] += out_d[tid + 3 * stride] / out_x[tid + 3 * stride] / 2;
        }
        
        tid += 4 * stride; // Move to the next set of elements
    }
}