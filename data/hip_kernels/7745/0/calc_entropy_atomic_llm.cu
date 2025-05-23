#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void calc_entropy_atomic(float *float_image_in, float *entropy_out, int blk_size) {
    // Calculate entropy of a block through a single thread
    __shared__ float sum;
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        sum = 0.0f;
    }
    __syncthreads();

    int blocksize = blk_size * blk_size;
    int v_offset_to_blkrow = gridDim.x * blockDim.x * blockDim.y * blockIdx.y;
    int v_offset_to_pixrow = blockDim.x * gridDim.x * threadIdx.y;
    int h_offset = blockDim.x * blockIdx.x + threadIdx.x;
    int idx = v_offset_to_blkrow + v_offset_to_pixrow + h_offset; // Index of top left corner of the block
    int out_idx = blockIdx.y * gridDim.x + blockIdx.x;

    // Normalize image
    float val = float_image_in[idx] * float_image_in[idx] / blocksize;
    atomicAdd(&sum, val);
    __syncthreads();

    __shared__ float entropy;
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        entropy = 0.0f;
    }
    __syncthreads();

    val = val / sum; // Update with normalized value
    // Shannon entropy
    atomicAdd(&entropy, -val * log2f(val));
    __syncthreads();

    if (threadIdx.x == 0 && threadIdx.y == 0) {
        entropy_out[out_idx] = entropy;
    }
}