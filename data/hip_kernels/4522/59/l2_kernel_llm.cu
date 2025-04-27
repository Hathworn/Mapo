#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Use shared memory for better performance if multiple threads access the same data
    extern __shared__ float shared_mem[];
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if(i < n){
        float pred_val = pred[i];  // Reduce global memory access by storing in a register
        float truth_val = truth[i]; // Reduce global memory access by storing in a register
        float diff = truth_val - pred_val;
        error[i] = diff * diff;
        delta[i] = diff;
    }
}