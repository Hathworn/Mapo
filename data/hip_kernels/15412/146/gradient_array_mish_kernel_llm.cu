#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float softplus_kernel(float x, float threshold = 20) {
    if (x > threshold) return x;                // too large
    else if (x < -threshold) return expf(x);    // too small
    return log1pf(expf(x));                     // optimized, avoid redundant computation
}

__global__ void gradient_array_mish_kernel(int n, float *activation_input_gpu, float *delta) {
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i < n) {
        const float MISH_THRESHOLD = 20.0f;

        // Use shared memory to store frequently used variables for faster access
        __shared__ float shared_inp, shared_sp, shared_tsp, shared_grad_sp;

        shared_inp = activation_input_gpu[i];
        shared_sp = softplus_kernel(shared_inp, MISH_THRESHOLD);
        shared_grad_sp = -expm1f(-shared_sp);
        shared_tsp = tanh(shared_sp);

        __syncthreads(); // Ensure all threads have computed the shared variables

        const float grad_tsp = (1.0f - shared_tsp * shared_tsp) * shared_grad_sp;
        const float grad = shared_inp * grad_tsp + shared_tsp;
        delta[i] *= grad;
    }
}