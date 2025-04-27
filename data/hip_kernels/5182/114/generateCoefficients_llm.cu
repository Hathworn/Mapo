#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel to generate coefficients with optimization for better performance
__global__ void generateCoefficients(float *chromosomes, const int chromSize, const float* noise, const int population, const int alpha){

    // Calculate unique global thread ID
    int threadGlobalID = blockIdx.x * blockDim.x + threadIdx.x;

    // Initialize RNG state
    hiprandState st;
    hiprand_init((int)noise[threadGlobalID] << threadGlobalID, threadGlobalID * (threadGlobalID == population - 1 ? noise[0] : noise[threadGlobalID]), 0, &st);

    // Process only valid global thread IDs
    if (threadGlobalID > 0 && threadGlobalID < population * blockDim.x * gridDim.x) {
        // Process chromosome with potential SIMD-friendly loop optimization
        #pragma unroll
        for (int i = 0; i < chromSize; i++){
            float randomValue = hiprand_uniform(&st); // Store RNG result to improve performance
            chromosomes[chromSize * threadGlobalID + i] = (randomValue < 0.5 ? randomValue : -randomValue) * alpha;
        }
    }
}