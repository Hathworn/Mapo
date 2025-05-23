#include "hip/hip_runtime.h"
#include "includes.h"

namespace ann {

}

__global__ void kernel_weight_update( int layer_id, int *l, int *s, int *sw, float *z_arr, float *a_arr, float *t_arr, float *gjl, float *w_arr, float *dw_arr, float eta, float alpha ){

    int idx = threadIdx.x + blockDim.x * blockIdx.x;

    int neuron_count = l[layer_id];
    int neuron_count_next = l[layer_id + 1];

    if (idx >= neuron_count) return;

    float a = a_arr[s[layer_id] + idx];

    int offset = sw[layer_id] + idx * (neuron_count_next - 1); // Calculate offset outside loop
    for (int k = 0; k < neuron_count_next - 1; k++) {
        float grad = a * gjl[s[layer_id + 1] + k]; // Use the pre-calculated value `a`

        int dw_w_index = offset + k; // Use pre-calculated offset
        float dw_val = -eta * grad + alpha * dw_arr[dw_w_index];
        dw_arr[dw_w_index] = dw_val;
        w_arr[dw_w_index] += dw_val; // Use the same index for updating w
    }
}