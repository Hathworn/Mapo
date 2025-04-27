#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void logistic_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to reduce repetitive computations
    extern __shared__ float shmem[];
    float *s_truth = shmem;
    float *s_pred = &shmem[blockDim.x];

    if (i < n) {
        s_truth[threadIdx.x] = truth[i];
        s_pred[threadIdx.x] = pred[i];
        __syncthreads(); // Ensure all threads have loaded data

        float t = s_truth[threadIdx.x];
        float p = s_pred[threadIdx.x];
        error[i] = -t * logf(p + 1e-7f) - (1 - t) * logf(1 - p + 1e-7f); // Use logf for float operations
        delta[i] = t - p;
    }
}