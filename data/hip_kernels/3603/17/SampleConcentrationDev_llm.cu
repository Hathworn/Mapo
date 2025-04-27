#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SampleConcentrationDev(float* concentration, const uint2* cellStartEnd) {
    // Calculate the linear index of the current thread
    const uint cellid = blockIdx.x + blockIdx.y * gridDim.x + threadIdx.x * gridDim.x * gridDim.y;
    
    // Directly load the start and end values for the cell
    uint2 cellStEnd = cellStartEnd[cellid];

    // Store the difference (concentration) in the output array
    concentration[cellid] = cellStEnd.y - cellStEnd.x;
}