#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
{










}
__global__ void updateParams(int N, int M, float alpha, float beta1, float beta2, float t, float *PARAMS, float *GRADS, float *m, float *v)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate linear index once for reuse
    int index = j * N + i;

    if (i < N && j < M)
    {
        // Precompute to avoid redundant calculation
        float beta1r = 1.0f - beta1;
        float alphar = -alpha / (1.0f - __powf(beta1, t));

        // Update moving average of gradients
        float grad = GRADS[index];
        float m_val = m[index] = beta1 * m[index] + beta1r * grad;

        // Update moving average of squared gradients with safe guard
        v[index] = max(beta2 * v[index], max(fabsf(grad), 1.0e-16f));

        // Update parameters leveraging precomputed alphar
        PARAMS[index] = alphar * (m_val / v[index]) + PARAMS[index];
    }
}