#include "hip/hip_runtime.h"
#include "includes.h"

static const int NTHREADS = 32;

__global__ void cunn_ClassNLLCriterion_updateOutput_kernel(float *output, float *total_weight, float *input, float *target, float *weights, int size_average, int nframe, int ndim, int n_classes) {
    __shared__ float shInputs[NTHREADS], acc_weight[NTHREADS];
    int i, t;
    float cur_weight;
    
    // Initialize shared memory
    shInputs[threadIdx.x] = 0.0f;
    acc_weight[threadIdx.x] = 0.0f;

    // Compute using strides over nframe
    for (i = threadIdx.x; i < nframe; i += blockDim.x) {
        t = target[i] - 1;
        if (t >= 0 && t < n_classes) {
            cur_weight = weights ? weights[t] : 1.0f;
            atomicAdd(&shInputs[threadIdx.x], -input[i * ndim + t] * cur_weight);
            atomicAdd(&acc_weight[threadIdx.x], cur_weight);
        }
    }
    __syncthreads();

    // Reduction and final update
    if (threadIdx.x == 0) {
        *output = *total_weight = 0;
        for (i = 0; i < NTHREADS; ++i){
            atomicAdd(output, shInputs[i]);
            atomicAdd(total_weight, acc_weight[i]);
        }
        if (size_average && *total_weight > 0) {
            *output /= *total_weight;
        }
    }
}