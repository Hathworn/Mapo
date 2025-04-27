#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void g_getSmrWgrad(float* wgrad, float* weight, float lambda, int len, int batch)
{
    // Calculate the global index for each thread
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Loop over the elements with stride equal to the total number of threads
    while (id < len) {
        // Update wgrad
        wgrad[id] = lambda * weight[id] + wgrad[id] / batch;
        
        // Move to the next set of elements
        id += gridDim.x * blockDim.x;
    }
}