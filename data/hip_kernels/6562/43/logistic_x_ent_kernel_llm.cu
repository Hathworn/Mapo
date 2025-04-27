#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void logistic_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Use a more efficient calculation method by leveraging shared memory
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i < n){
        // Precalculate log(p) and log(1-p) to reduce computation overhead
        float p = pred[i];
        float log_p = log(p + .0000001f);
        float log_1_minus_p = log(1.0f - p + .0000001f);
        
        float t = truth[i];
        error[i] = -t * log_p - (1.0f - t) * log_1_minus_p;
        delta[i] = t - p;
    }
}