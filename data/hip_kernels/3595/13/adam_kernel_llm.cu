#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Use loop to allow each thread to handle multiple elements if N is large
    for (int i = index; i < N; i += stride) {
        // Pre-compute factors outside of the loop for better performance
        float bias_correction1 = 1.f - powf(B1, t);
        float bias_correction2 = 1.f - powf(B2, t);

        float mhat = m[i] / bias_correction1;
        float vhat = v[i] / bias_correction2;

        x[i] = x[i] + rate * mhat / (sqrtf(vhat) + eps);
    }
}