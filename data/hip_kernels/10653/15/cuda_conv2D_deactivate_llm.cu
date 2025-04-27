#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_conv2D_deactivate(double* err, const double* net, const double* activation, size_t outputs)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if index is within bounds and update error in the same condition
    if(id < outputs) {
        double act = activation[id]; // Load activation value to avoid multiple memory accesses
        err[id] *= (1.0 - act * act); // Use pre-loaded activation value
    }
}