#include "hip/hip_runtime.h"
#include "includes.h"

/* Optimized GPU kernel. */

// y = inputs[0], y_ = inputs[1]
// np.mean(-np.sum(y_ * np.log(softmax(y)), axis=1), keepdims=True)

__global__ void matrix_elementwise_add_by_const_kernel(const float *d_in, float *d_out, float val, int n) {
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index stays within bounds
    if (index < n) {
        // Perform element-wise addition with the constant
        d_out[index] = d_in[index] + val;
    }
}