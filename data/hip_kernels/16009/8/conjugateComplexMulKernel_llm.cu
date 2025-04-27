#include "hip/hip_runtime.h"
#include "includes.h"

//Squared sum of a tile without the border
extern "C"

//Boxfilter ignoring the border parts
//blockDim.X must be tileSize + 2 * maxShift
//blockDim.Y must be 1
extern "C"
//Boxfilter ignoring the border parts
//blockDim.Y must be tileSize + 2 * maxShift
//blockDim.X must be 1
extern "C"

//Computed the normalized CC values out of the different input data
//Cross correlation is fft shifted
//blockDim.X must be 2 * maxShift
//blockDim.Y must be 2 * maxShift
//blockDim.Z must be nr of tiles
extern "C"

//Convert a tiled image into consecutive tiles for FFT
//input img has a pitch, output tiles are consecutive
//output tiles overlap by maxShift is filled by zero
extern "C"

//Convert a tiled image into consecutive tiles for FFT
//input img has a pitch, output tiles are consecutive
//output tiles overlap by maxShift on each side
extern "C"

__global__ void conjugateComplexMulKernel(const float2* __restrict__ aIn, float2* __restrict__ bInOut, int maxElem)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Early exit to minimize unnecessary computation
    if (idx >= maxElem) return;

    // Efficiently fetch the inputs once
    float2 valA = aIn[idx];
    float2 valB = bInOut[idx];

    // Precomputed conjugate complex
    float valA_y_conj = -valA.y;

    // Perform complex multiplication
    float2 res;
    res.x = valA.x * valB.x - valA_y_conj * valB.y;
    res.y = valA.x * valB.y + valA_y_conj * valB.x;
    
    // Store the result back
    bInOut[idx] = res;
}