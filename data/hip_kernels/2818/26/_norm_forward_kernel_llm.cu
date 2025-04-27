#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _norm_forward_kernel(float *x, float *mean, float *variance, int b, int c, int wxh) {
    int ind = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified calculation of 'ind'
    int num_elements = b * c * wxh;  // Pre-calculation for loop boundary

    for (int idx = ind; idx < num_elements; idx += blockDim.x * gridDim.x) {  // Loop over elements with grid-stride
        int j = (idx / wxh) % c;  // Calculate 'j' for current element
        x[idx] = (x[idx] - mean[j]) / (sqrt(variance[j] + 0.000001f));  // Perform normalization
    }
}