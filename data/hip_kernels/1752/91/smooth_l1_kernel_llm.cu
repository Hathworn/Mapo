#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Use shared memory for improved memory access
    // Allocate shared memory for block calculations
    extern __shared__ float shared_mem[];

    // Calculate the index and load data into shared memory
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    float diff = 0.0f, abs_val = 0.0f;

    if (i < n) {
        diff = truth[i] - pred[i];
        abs_val = fabsf(diff);

        // Utilize shared memory for intermediate calculations
        shared_mem[threadIdx.x] = abs_val;

        __syncthreads();  // Synchronize within block to ensure shared memory is updated

        if(shared_mem[threadIdx.x] < 1) {
            error[i] = diff * diff;
            delta[i] = diff;
        } else {
            error[i] = 2 * shared_mem[threadIdx.x] - 1;
            delta[i] = (diff > 0) ? 1 : -1;
        }
    }
}