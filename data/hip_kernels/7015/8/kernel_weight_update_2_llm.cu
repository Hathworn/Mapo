#include "hip/hip_runtime.h"
#include "includes.h"

namespace ann {

}

__global__ void kernel_weight_update_2(int layer_id, int *l, int *s_ext, int *sw_ext, float *z_ext_arr, float *a_ext_arr, float *t_arr, float *gjl_ext, float *w_ext_arr, float *dw_ext_arr, float eta, float alpha) {

    // Calculate thread indices and check bounds
    int idx = threadIdx.y + blockDim.y * blockIdx.y;
    if (idx >= l[layer_id]) return;

    int pidx = threadIdx.x;
    int h = blockDim.x;
    int neuron_count_next = l[layer_id + 1];

    float a = a_ext_arr[s_ext[layer_id] + idx];

    int index0 = s_ext[layer_id + 1] + pidx;
    int index1 = sw_ext[layer_id] + idx * (neuron_count_next - 1) + pidx;

    // Unroll loop to improve performance
    for (int k = pidx; k < neuron_count_next - 1; k += h) {
        // Calculate gradient and weight update
        float grad = a * gjl_ext[index0];
        float dw = -eta * grad + alpha * dw_ext_arr[index1];
        
        // Update weights
        dw_ext_arr[index1] = dw;
        w_ext_arr[index1] += dw;
        
        index0 += h;
        index1 += h;
    }
}