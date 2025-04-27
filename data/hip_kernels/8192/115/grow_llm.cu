#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void grow(float *matrices, const int dimension, const int coefficients, const int population, float *chromosomes, const float *noise, const float mutationRate, const int kept, const float* fitnesses, int *mark, const int alpha){

    // Initialize thread ID and random state
    int threadGlobalID = blockIdx.x * blockDim.x * blockDim.y * blockDim.z
        + threadIdx.z * blockDim.y * blockDim.x + threadIdx.y * blockDim.x + threadIdx.x;
    int chromOffset = threadGlobalID * coefficients;
    hiprandState st;
    hiprand_init((int)noise[threadGlobalID] << threadGlobalID, threadGlobalID * (threadGlobalID == population - 1 ? noise[0] : noise[threadGlobalID]), 0, &st);
  
    if (threadGlobalID > kept - 1) {
        int parent1 = floor(hiprand_uniform(&st) * kept);
        int parent2 = floor(hiprand_uniform(&st) * kept);
        int point = floor(hiprand_uniform(&st) * coefficients);

        // Copy chromosome segments from parents
        for (int i = 0; i < point; i++) {
            chromosomes[chromOffset + i] = chromosomes[parent1 * coefficients + i];
        }
        for (int i = point; i < coefficients; i++) {
            chromosomes[chromOffset + i] = chromosomes[parent2 * coefficients + i];
        }

        // Mutate children chromosomes
        for (int i = 0; i < coefficients; i++) {
            if (hiprand_uniform(&st) <= mutationRate) {
                chromosomes[chromOffset + i] = (hiprand_uniform(&st) - 0.5f) * 2 * alpha; // Optimized mutation
            }
        }
    }

    if (threadGlobalID < coefficients) {
        // Evaluate fitness and mark genes for permutation
        float invDist = 1.0f / (fitnesses[0] - fitnesses[population - 1]);
        for (int i = 0; i < population; i++) {
            float probability = 1.0f - sqrtf((fitnesses[i] - fitnesses[population - 1]) * invDist); // Cache optimization
            mark[coefficients * i + threadGlobalID] = (hiprand_uniform(&st) < probability);
        }
        
        // Perform gene permutation
        wloc = -1;
        float tmp1 = 0.0f;
        for (int i = 0; i < population; i++) {
            if (mark[coefficients * i + threadGlobalID] == 1) {
                if (wloc == -1) {
                    wloc = i;
                    tmp1 = chromosomes[coefficients * i + threadGlobalID];
                } else {
                    float tmp2 = chromosomes[coefficients * i + threadGlobalID];
                    chromosomes[coefficients * i + threadGlobalID] = tmp1;
                    tmp1 = tmp2;
                }
            }
        }
        if (wloc != -1) {
            chromosomes[coefficients * wloc + threadGlobalID] = tmp1;
        }
    }

    __syncthreads();

    // Initialize matrices to zero
    for (int i = 0; i < dimension * dimension; i++) {
        matrices[threadGlobalID * dimension * dimension + i] = 0.0f;
    }
}