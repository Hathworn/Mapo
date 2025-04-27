#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Bprop1(const float* dlayer1, const float* dlayer1i, const float* dlayer1o, const float* in, float* dsyn1, float* dsyn1i, float* dsyn1o, const float alpha)
{
    int i = blockDim.y * blockIdx.y + threadIdx.y; // 64
    int j = threadIdx.x;                           // 256
    int k = blockIdx.x;                            // Data.count

    // Cache value for optimization
    float in_cache = in[k * 64 + i] * alpha;

    // Separate indices calculations to reduce redundant computations
    int offset = i * 256 + j;
    int dlayer_offset = k * 256 + j;

    // Use local variable to minimize memory latency
    float contrib_dsyn1  = dlayer1[dlayer_offset] * in_cache;
    float contrib_dsyn1i = dlayer1i[dlayer_offset] * in_cache;
    float contrib_dsyn1o = dlayer1o[dlayer_offset] * in_cache;

    // Perform atomic additions
    atomicAdd(&dsyn1[offset],  contrib_dsyn1);
    atomicAdd(&dsyn1i[offset], contrib_dsyn1i);
    atomicAdd(&dsyn1o[offset], contrib_dsyn1o);
}