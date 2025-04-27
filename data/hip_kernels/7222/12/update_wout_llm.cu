#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_wout(double * weights_out_d, double *weights_out_delta_d, int bit){
    // Use shared memory for reduction
    __shared__ double weights_out_delta_s[OUTPUTS * H_HEIGHT];
    
    int tix = threadIdx.x;
    int tiy = threadIdx.y;
    int offset = OUTPUTS * H_HEIGHT;
    int index = tiy * offset + tix;

    // Load data into shared memory
    weights_out_delta_s[index] = weights_out_delta_d[index];
    __syncthreads();

    // Perform reduction in shared memory
    for(int s = blockDim.y / 2; s > 0; s >>= 1) {
        if(tiy < s) {
            weights_out_delta_s[index] += weights_out_delta_s[index + s * offset];
        }
        __syncthreads();
    }

    // Update weights and reset delta
    if(tiy == 0){
        atomicAdd(&weights_out_d[tix], -(alpha_d * weights_out_delta_s[tix] / (true_sample * 55.0)));
    }
    __syncthreads();
    if (index < offset) { // Ensure the index is valid for reset
        weights_out_delta_d[index] = 0.0;
    }
}