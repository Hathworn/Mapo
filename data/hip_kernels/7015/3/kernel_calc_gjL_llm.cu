#include "hip/hip_runtime.h"
#include "includes.h"

namespace ann {








// CUDA2





}

__global__ void kernel_calc_gjL( int layer_id, int *l, int *s, int *sw, float *z_arr, float *a_arr, float *t_arr, float *gjl, float *w_arr ){

    int idx = threadIdx.x + blockDim.x * blockIdx.x;

    int neuron_count = l[layer_id];
    int neuron_count_next = l[layer_id + 1];

    if (idx >= neuron_count - 1) return;

    float z = z_arr[s[layer_id] + idx];
    // Precompute expf(-z) for efficiency
    float exp_neg_z = expf(-z);  
    float tmp = 1 + exp_neg_z;
    // Derivative calculation optimized by reusing exp_neg_z
    float f_deriv = exp_neg_z / (tmp * tmp);

    float sum = 0;
    int offset_next_layer = sw[layer_id] + idx * (neuron_count_next - 1);
    int gjl_offset_next_layer = s[layer_id + 1];
    // Unroll loop for potential better performance (compiler might optimize further)
    for (int k = 0; k < neuron_count_next - 1; k++) {
        sum += w_arr[offset_next_layer + k] * gjl[gjl_offset_next_layer + k];
    }

    gjl[s[layer_id] + idx] = f_deriv * sum;
    // printf("Kernelis %d - %.20f\n", s[layer_id] + idx, gjl[s[layer_id] + idx]);
}