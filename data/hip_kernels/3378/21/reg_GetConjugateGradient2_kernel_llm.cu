#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reg_GetConjugateGradient2_kernel(float4 *nodeNMIGradientArray_d, float4 *conjugateG_d, float4 *conjugateH_d)
{
    // Calculate global thread ID
    const int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure threads do not exceed array bounds
    if (tid < c_NodeNumber) {
        // Load node gradient
        float4 gradGValue = nodeNMIGradientArray_d[tid];
        
        // Compute G = -grad
        gradGValue = make_float4(-gradGValue.x, -gradGValue.y, -gradGValue.z, 0.0f);
        conjugateG_d[tid] = gradGValue;

        // Load and update H = G + scalingFactor * H
        float4 gradHValue = conjugateH_d[tid];
        gradHValue = make_float4(
            gradGValue.x + c_ScalingFactor * gradHValue.x,
            gradGValue.y + c_ScalingFactor * gradHValue.y,
            gradGValue.z + c_ScalingFactor * gradHValue.z,
            0.0f);
        conjugateH_d[tid] = gradHValue;
        
        // Update node gradient
        nodeNMIGradientArray_d[tid] = make_float4(-gradHValue.x, -gradHValue.y, -gradHValue.z, 0.0f);
    }
}