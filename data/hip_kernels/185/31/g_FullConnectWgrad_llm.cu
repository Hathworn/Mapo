#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void g_FullConnectWgrad(float* wgrad, float* w, int len, float lambda, int batch)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    // Efficiently iterate through all elements by striding over the entire grid
    for(int i = id; i < len; i += blockDim.x * gridDim.x)
    {
        if(fabs(lambda) < 1e-10)
            wgrad[i] = wgrad[i] / batch; // Simplified computation when lambda is negligible
        else
            wgrad[i] = (wgrad[i] / batch + lambda * w[i]); // Regular computation with lambda influence
    }
}