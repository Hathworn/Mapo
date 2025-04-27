#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Loop over the elements with a stride to utilize all threads effectively
    for (int i = index; i < N; i += stride) {
        // Precompute factors
        float B1_pow_t = __powf(B1, t);
        float B2_pow_t = __powf(B2, t);

        float mhat = m[i] / (1.f - B1_pow_t);
        float vhat = v[i] / (1.f - B2_pow_t);

        // Update x using precomputed mhat and vhat
        x[i] = x[i] + rate * mhat / (sqrtf(vhat) + eps);
    }
}