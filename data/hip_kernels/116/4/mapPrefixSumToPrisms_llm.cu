#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mapPrefixSumToPrisms(const unsigned numberOfPrisms, const unsigned raysPerSample, const unsigned reflectionSlices, const unsigned* raysPerPrism, const unsigned* prefixSum, unsigned* indicesOfPrisms, unsigned* numberOfReflections) {

    int id = threadIdx.x + (blockIdx.x * blockDim.x);

    // Return early if id exceeds bounds
    if (id >= numberOfPrisms * reflectionSlices) return;

    // Calculate indexes
    const unsigned count            = raysPerPrism[id];
    const unsigned startingPosition = prefixSum[id];
    const unsigned reflection_i     = id / numberOfPrisms;
    const unsigned prism_i          = id % numberOfPrisms;

    // Use parallel loop with stride
    for (unsigned i = startingPosition; i < startingPosition + count; ++i) {
        indicesOfPrisms[i] = prism_i;
        numberOfReflections[i] = reflection_i;
    }
}