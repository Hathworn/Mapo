#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AssembleArrayOfNoticedChannels(const int nmbrOfChnnls, const float lwrNtcdEnrg, const float hghrNtcdEnrg, const float *lwrChnnlBndrs, const float *hghrChnnlBndrs, const float *gdQltChnnls, float *ntcdChnnls) {
    // Use shared memory for faster access and reduction of global memory access
    __shared__ float s_lwrNtcdEnrg;
    __shared__ float s_hghrNtcdEnrg;
    
    if (threadIdx.x == 0) {
        s_lwrNtcdEnrg = lwrNtcdEnrg;
        s_hghrNtcdEnrg = hghrNtcdEnrg;
    }
    __syncthreads();

    // Calculate array index
    int c = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Check bounds only if within range
    if (c < nmbrOfChnnls) {
        float lowerBoundary = lwrChnnlBndrs[c];
        float higherBoundary = hghrChnnlBndrs[c];
        float quality = gdQltChnnls[c];

        // Perform channel notice calculation
        ntcdChnnls[c] = (lowerBoundary > s_lwrNtcdEnrg) * (higherBoundary < s_hghrNtcdEnrg) * (1.0f - quality);
    }
}