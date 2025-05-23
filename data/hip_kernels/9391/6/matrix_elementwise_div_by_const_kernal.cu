#include "hip/hip_runtime.h"
#include "includes.h"

/* TODO: Your code here */
/* all your GPU kernel code, e.g. matrix_softmax_cross_entropy_kernel */

// y = inputs[0], y_ = inputs[1]
// np.mean(-np.sum(y_ * np.log(softmax(y)), axis=1), keepdims=True)




__global__ void matrix_elementwise_div_by_const_kernal(const float *d_in, float *d_out, float val, int n) {
int index = blockIdx.x * blockDim.x + threadIdx.x;
if (index < n) {
d_out[index] = d_in[index] / val;
}
}