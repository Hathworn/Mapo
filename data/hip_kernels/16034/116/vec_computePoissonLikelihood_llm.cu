#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_computePoissonLikelihood(int n, double *result, double *image, double *model)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * blockDim.x * gridDim.x + threadIdx.y * gridDim.x * blockDim.x);
    
    // Check if thread id is within bounds
    if (id < n)
    {
        double model_val = model[id];
        
        // If model value is greater than 0, calculate result
        if (model_val > 0.0)
        {
            result[id] = model_val - image[id] * log(model_val);
        }
        else
        {
            // Assign a large number if model value is less than or equal to 0
            result[id] = 10000000.0;
        }
    }
}