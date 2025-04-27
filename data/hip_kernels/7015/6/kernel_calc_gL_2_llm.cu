#include "hip/hip_runtime.h"
#include "includes.h"

namespace ann {

}

__global__ void kernel_calc_gL_2(int layer_id, int *l, int *s_ext, float *z_ext_arr, float *a_ext_arr, float *t_arr, float *gjl_ext) {
    int idx = threadIdx.x + blockDim.x * blockIdx.x;

    int neuron_count = l[layer_id];

    if (idx >= neuron_count - 1) return;

    float z = z_ext_arr[s_ext[layer_id] + idx];
    
    // Calculate exp(-z) once and reuse
    float exp_neg_z = expf(-z);
    
    // Use the common subexpression to avoid redundant computation
    float tmp = 1 + exp_neg_z;
    float f_deriv = exp_neg_z / (tmp * tmp);

    // Store result directly
    gjl_ext[s_ext[layer_id] + idx] = f_deriv * (a_ext_arr[s_ext[layer_id] + idx] - t_arr[idx]);
}