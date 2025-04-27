```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void bpnn_adjust_weights_cuda(float * delta, int hid, float * ly, int in, float * w, float * oldw )
{
    int by = blockIdx.y;
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // Calculate indices for weight and layer arrays
    int index =  ( hid + 1 ) * HEIGHT * by + ( hid + 1 ) * ty + tx + 1 + ( hid + 1 );
    int index_y = HEIGHT * by + ty + 1;
    int index_x = tx + 1;

    // Cache delta and ly values in shared memory for reduced global memory accesses
    __shared__ float shared_delta[BLOCK_DIM_X];
    __shared__ float shared_ly[BLOCK_DIM_Y];
    
    if (tx < BLOCK_DIM_X)
        shared_delta[tx] = delta[index_x];
    if (ty < BLOCK_DIM_Y)
        shared_ly[ty] = ly[index_y];
    __syncthreads();
    
    float delta_val = shared_delta[tx];
    float ly_val = shared_ly[ty];
    
    // Update weights and momentum
    float weight_update = ETA * delta_val * ly_val + MOMENTUM * oldw[index];
    w[index] += weight_update;
    oldw[index] = weight_update;

    __syncthreads();

    // Handle edge case for ty == 0 and by == 0
    if (ty == 0 && by == 0)
    {
        float bias_update = ETA * delta_val + MOMENTUM * oldw[index_x];
        w[index_x] += bias_update;
        oldw[index_x] = bias_update;
    }
}