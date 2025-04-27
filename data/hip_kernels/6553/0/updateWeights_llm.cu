#include "hip/hip_runtime.h"
#include "includes.h"

__device__ double calculateValueOfWeight(double parameter, int sign, double alpha)
{
    return (parameter * sign * alpha);
}

__global__ void updateWeights(double* weights, double* parameters, double* otherp, int sign, double alpha)
{
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Ensure index is within bounds
    if (index < blockDim.x * gridDim.x) 
    {
        weights[index] += calculateValueOfWeight(parameters[index], sign, alpha);
    }
}