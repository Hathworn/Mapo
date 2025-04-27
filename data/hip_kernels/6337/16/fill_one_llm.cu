#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fill_one(float * prp_0,int sz)
{
    // Calculate flattened global thread index
    int index = blockIdx.z * blockDim.z * sz * sz + blockIdx.y * blockDim.y * sz + blockIdx.x * blockDim.x 
                + threadIdx.z * sz * sz + threadIdx.y * sz + threadIdx.x;

    if(index < sz * sz * sz) // Boundary check to prevent out-of-bounds access
    {
        prp_0[index] = 1.0f;
    }
}