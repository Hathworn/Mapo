#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void Crossover(int *chromosome, int size, int start1, int end1, int start2, int end2, int mid) {
    for (int i = mid; i < size; i++) {
        int c1 = start1 + mid;
        int c2 = start2 + mid;
        int temp = chromosome[c1];
        chromosome[c1] = chromosome[c2];
        chromosome[c2] = temp;
    }
}

__device__ float generateRandom(hiprandState *globalState) {
    hiprandState localState = globalState[0];
    float RANDOM = hiprand_uniform(&localState);
    globalState[0] = localState;
    return RANDOM;
}

__device__ void Crossover(char *chromosome, int size, int start1, int end1, int start2, int end2, int mid) {
    for (int i = mid; i < size; i++) {
        int c1 = start1 + mid;
        int c2 = start2 + mid;
        int temp = chromosome[c1];
        chromosome[c1] = chromosome[c2];
        chromosome[c2] = temp;
    }
}

__device__ void Crossover(float *chromosome, int size, int start1, int end1, int start2, int end2, int mid) {
    for (int i = mid; i < size; i++) {
        int c1 = start1 + mid;
        int c2 = start2 + mid;
        float temp = chromosome[c1];
        chromosome[c1] = chromosome[c2];
        chromosome[c2] = temp;
    }
}

__global__ void gpuCrossover(int *chromosome, hiprandState *globalState, int sizeofChromosome, int sizeofPopulation, int Bias, float prob) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Generate crossover mid-point
    int mid = static_cast<int>(generateRandom(globalState) * sizeofChromosome);
    idx = idx * 2;
    int start1 = idx * sizeofChromosome;
    int end1 = start1 + sizeofChromosome;
    int start2 = end1;
    int end2 = start2 + sizeofChromosome;

    // Ensure indices are within limits
    if (end2 < (sizeofChromosome * sizeofPopulation))
        Crossover(chromosome, sizeofChromosome, start1, end1, start2, end2, mid);

    // Perform mutation with probability
    if ((int)(generateRandom(globalState) * 100) < (prob * 100)) {
        int j = static_cast<int>(generateRandom(globalState) * (sizeofChromosome / 4));
        for (int k = 0; k < j; k++) {
            int index = static_cast<int>(generateRandom(globalState) * sizeofChromosome);
            chromosome[index] = 1 - chromosome[index];  // Toggle between 0 and 1
        }
    }
}