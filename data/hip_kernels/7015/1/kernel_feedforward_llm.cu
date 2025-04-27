#include "hip/hip_runtime.h"
#include "includes.h"

namespace ann {








// CUDA2





}

__global__ void kernel_feedforward( int layer_id, int *l, int *s, int *sw, float *z_arr, float *a_arr, float *w_arr ){
    // Get the global thread index
    int idx = threadIdx.x + blockDim.x * blockIdx.x;

    // Get neuron counts for the current and previous layers
    int neuron_count = l[layer_id];
    int neuron_count_prev = l[layer_id-1];

    // Return if index is out of bounds
    if(idx >= neuron_count-1) return;

    // Initialize z accumulator
    float z = 0;

    // Optimize by unrolling loop manually with pragma, reducing loop overhead
    #pragma unroll
    for(int k = 0; k < neuron_count_prev; k++){
        // Accumulate weighted input
        z += w_arr[sw[layer_id-1] + k*(neuron_count - 1) + idx] * a_arr[s[layer_id-1] + k];
    }

    // Compute and store the weighted sum
    z_arr[s[layer_id] + idx] = z;

    // Apply activation function and store output
    float a = 1.0f / (1.0f + expf(-z));
    a_arr[s[layer_id] + idx] = a;
}