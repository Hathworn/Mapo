#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bpnn_adjust_weights_cuda(float * delta, int hid, float * ly, int in, float * w, float * oldw)
{
    int by = blockIdx.y;
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // Calculate indices for accessing weights and inputs
    int index = (hid + 1) * HEIGHT * by + (hid + 1) * ty + tx + 1 + (hid + 1);
    int index_y = HEIGHT * by + ty + 1;
    int index_x = tx + 1;
    
    // Use shared memory for storing the results of updated values temporarily
    __shared__ float shared_w[<relevant size>];
    __shared__ float shared_oldw[<relevant size>];

    // Optimize by using register for commonly accessed eta and momentum calculations
    float eta_delta_ly = ETA * delta[index_x] * ly[index_y];
    float momentum_oldw = MOMENTUM * oldw[index];
    
    // Update weights and old weights efficiently
    shared_w[threadIdx.x] = eta_delta_ly + momentum_oldw;
    w[index] += shared_w[threadIdx.x];
    shared_oldw[threadIdx.x] = shared_w[threadIdx.x];
    oldw[index] = shared_oldw[threadIdx.x];

    __syncthreads();

    // Update global weights in a single branch, removing the redundant calculation
    if (ty == 0 && by == 0) {
        eta_delta_ly = ETA * delta[index_x];
        momentum_oldw = MOMENTUM * oldw[index_x];
        
        shared_w[threadIdx.x] = eta_delta_ly + momentum_oldw;
        w[index_x] += shared_w[threadIdx.x];
        shared_oldw[threadIdx.x] = shared_w[threadIdx.x];
        oldw[index_x] = shared_oldw[threadIdx.x];
    }
}