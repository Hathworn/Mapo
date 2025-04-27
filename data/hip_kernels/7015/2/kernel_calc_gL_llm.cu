#include "hip/hip_runtime.h"
#include "includes.h"

namespace ann {

}

__global__ void kernel_calc_gL(int layer_id, int *l, int *s, float *z_arr, float *a_arr, float *t_arr, float *gjl) {
    int idx = threadIdx.x + blockDim.x * blockIdx.x;

    if (idx >= l[layer_id]) return; // Check neuron count directly

    int neuron_idx = s[layer_id] + idx;
    float z = z_arr[neuron_idx];
    float tmp = 1 + expf(-z);
    float f_deriv = expf(-z) / (tmp * tmp);

    gjl[neuron_idx] = f_deriv * (a_arr[neuron_idx] - t_arr[idx]);
}