#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized mapPrefixSumToPrisms kernel
__global__ void mapPrefixSumToPrisms(const unsigned numberOfPrisms, const unsigned raysPerSample, const unsigned reflectionSlices, const unsigned* raysPerPrism, const unsigned* prefixSum, unsigned *indicesOfPrisms, unsigned *numberOfReflections) {
    int id = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure valid thread id
    if (id >= numberOfPrisms * reflectionSlices) return;

    // Pre-calculate values used in the loop to reduce repetitive calculations
    const unsigned count = raysPerPrism[id];
    const unsigned startingPosition = prefixSum[id];
    const unsigned reflection_i = id / numberOfPrisms; 
    const unsigned prism_i = id % numberOfPrisms;

    // Use pointer arithmetic for more efficient memory access
    unsigned *indicesPtr = &indicesOfPrisms[startingPosition];
    unsigned *reflectionsPtr = &numberOfReflections[startingPosition];

    // Loop unrolling might help further if 'count' is small and predictable
    for (unsigned i = 0; i < count; ++i) {
        indicesPtr[i] = prism_i;
        reflectionsPtr[i] = reflection_i;
    }
}