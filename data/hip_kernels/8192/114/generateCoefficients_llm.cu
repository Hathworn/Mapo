#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void generateCoefficients(float *chromosomes, const int chromSize, const float* noise, const int population, const int alpha){

    // Calculate global thread ID
    int threadGlobalID = blockIdx.x * blockDim.x * blockDim.y * blockDim.z
                         + threadIdx.z * blockDim.y * blockDim.x 
                         + threadIdx.y * blockDim.x 
                         + threadIdx.x;

    // Early exit if thread ID is out of population bounds
    if (threadGlobalID >= population) return;

    // Initialize random state with more coherence
    hiprandState st;
    hiprand_init((int)noise[threadGlobalID] ^ threadGlobalID, threadGlobalID, 0, &st);

    // Generate coefficients only if thread ID is valid
    for (int i = 0; i < chromSize; i++){
        float randomValue = hiprand_uniform(&st) * alpha;
        chromosomes[chromSize * threadGlobalID + i] = (hiprand_uniform(&st) < 0.5) ? randomValue : -randomValue;
    }
}