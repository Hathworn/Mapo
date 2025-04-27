#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void grow(float *matrices, const int dimension, const int coefficients, const int population, float *chromosomes, const float * noise, const float mutationRate, const int kept, const float* fitnesses, int *mark, const int alpha) {

    int i, wloc;
    hiprandState st;

    int threadGlobalID = blockIdx.x * blockDim.x * blockDim.y * blockDim.z
                         + threadIdx.z * blockDim.y * blockDim.x + threadIdx.y * blockDim.x + threadIdx.x;

    int chromOffset = threadGlobalID * coefficients;

    if (threadGlobalID >= population) return;  // Prevent out-of-bound access

    hiprand_init((int)noise[threadGlobalID] << threadGlobalID, threadGlobalID * (threadGlobalID == population - 1 ? noise[0] : noise[threadGlobalID]), 0, &st);

    if (threadGlobalID >= kept) { // Combined repopulate and mutate
        int parent1 = floor(hiprand_uniform(&st) * kept);
        int parent2 = floor(hiprand_uniform(&st) * kept);
        int point = floor(hiprand_uniform(&st) * coefficients);

        for (i = 0; i < coefficients; i++) {
            chromosomes[chromOffset + i] = (i < point ? chromosomes[parent1 * coefficients + i] : chromosomes[parent2 * coefficients + i]);

            if (hiprand_uniform(&st) <= mutationRate) { // Mutate
                chromosomes[chromOffset + i] *= (hiprand_uniform(&st) < 0.5 ? -alpha : alpha);
            }
        }
    }

    if (threadGlobalID < coefficients) {
        for (i = 0; i < population; i++) {
            float probability = 1 - sqrtf((fitnesses[i] - fitnesses[population - 1]) / (fitnesses[0] - fitnesses[population - 1]));
            mark[coefficients * i + threadGlobalID] = hiprand_uniform(&st) < probability ? 1 : 0;
        }

        wloc = -1;
        float tmp1;

        for (i = 0; i < population; i++) {
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
    
    for (i = 0; i < dimension * dimension; i++) {
        matrices[threadGlobalID * dimension * dimension + i] = 0.0f;
    }
}