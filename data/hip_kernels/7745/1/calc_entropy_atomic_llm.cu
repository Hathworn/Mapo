#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calc_entropy_atomic(float *float_image_in, float *entropy_out, int blk_size) {

    // Use shared memory for intermediate sum
    __shared__ float sum;
    __shared__ float entropy;

    if (threadIdx.x == 0 && threadIdx.y == 0) {
        sum = 0.0f;
        entropy = 0.0f;
    }
    __syncthreads();
    
    int blocksize = blk_size * blk_size;
    // Calculate pixel index offset for each block and thread
    int v_offset_to_blkrow = gridDim.x * blockDim.x * blockDim.y * blockIdx.y;
    int v_offset_to_pixrow = blockDim.x * gridDim.x * threadIdx.y;
    int h_offset = blockDim.x * blockIdx.x + threadIdx.x;
    int idx = v_offset_to_blkrow + v_offset_to_pixrow + h_offset;
    int out_idx = blockIdx.y * gridDim.x + blockIdx.x;
    
    // Normalize image
    float normalizedValue = float_image_in[idx] * float_image_in[idx] / blocksize;
    atomicAdd(&sum, normalizedValue);
    __syncthreads();
    
    normalizedValue /= sum;
    // Calculate Shannon entropy using atomic addition
    if (normalizedValue > 0) { // Ensure log is not computed for zero
        atomicAdd(&entropy, -normalizedValue * log2(normalizedValue));
    }
    
    __syncthreads();
    
    // Write entropy result to the output array
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        entropy_out[out_idx] = entropy;
    }
}