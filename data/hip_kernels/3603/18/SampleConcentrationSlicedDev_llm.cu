#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void SampleConcentrationSlicedDev(float* concentration, uint slice, const uint2* cellStartEnd)
{
    // Calculate unique thread index for the block
    const uint cellid = blockIdx.x + blockDim.x * (threadIdx.x + slice * blockDim.x);
    
    // Load cell start and end indices
    uint2 cellStEnd = cellStartEnd[cellid];

    // Write the concentration result back to global memory
    concentration[cellid] = cellStEnd.y - cellStEnd.x; // Directly use 'cellid' for global write
}