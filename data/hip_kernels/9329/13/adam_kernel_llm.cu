#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    // Use shared memory to optimize repetitive calculations
    __shared__ float shared_B1_pow, shared_B2_pow;
    if (threadIdx.x == 0) {
        shared_B1_pow = 1.F - powf(B1, t);
        shared_B2_pow = sqrtf(1.F - powf(B2, t));
    }
    __syncthreads();

    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (index < N) {
        // Reuse shared memory values for computation
        float denom = shared_B1_pow * (sqrtf(v[index]) + eps);
        x[index] -= rate * shared_B2_pow * m[index] / denom;
    }
}