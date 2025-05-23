#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void Crossover(int *chromosome, int size, int start1, int end1, int start2, int end2, int mid) {
    for (int i = mid; i < size; i++) {
        int c1 = start1 + mid;
        int c2 = start2 + mid;
        // Swap elements using a temporary variable
        int temp = chromosome[c1];
        chromosome[c1] = chromosome[c2];
        chromosome[c2] = temp;
    }
}

__device__ float generateRandom(hiprandState* globalState) {
    hiprandState localState = globalState[0];
    // Generate a random number
    float RANDOM = hiprand_uniform(&localState);
    globalState[0] = localState;
    return RANDOM;
}

__device__ void Crossover(char *chromosome, int size, int start1, int end1, int start2, int end2, int mid) {
    for (int i = mid; i < size; i++) {
        int c1 = start1 + mid;
        int c2 = start2 + mid;
        // Swap elements using a temporary variable
        int temp = chromosome[c1];
        chromosome[c1] = chromosome[c2];
        chromosome[c2] = temp;
    }
}

__device__ float generateRandomc(hiprandState* globalState) {
    hiprandState localState = globalState[0];
    // Generate a random number
    float RANDOM = hiprand_uniform(&localState);
    globalState[0] = localState;
    return RANDOM;
}

__device__ void Crossover(float *chromosome, int size, int start1, int end1, int start2, int end2, int mid) {
    for (int i = mid; i < size; i++) {
        int c1 = start1 + mid;
        int c2 = start2 + mid;
        // Swap elements using a temporary variable
        int temp = chromosome[c1];
        chromosome[c1] = chromosome[c2];
        chromosome[c2] = temp;
    }
}

__global__ void gpuCrossover(char *chromosome, hiprandState *globalState, int sizeofChromosome, int sizeofPopulation, int Bias, float prob, char* range) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int mid = static_cast<int>(generateRandomc(globalState) * sizeofChromosome); // Avoid repetitive typecasting
    idx *= 2;
    int start1, end1, start2, end2;
    start1 = idx * sizeofChromosome;
    end1 = start1 + sizeofChromosome;
    start2 = end1;
    end2 = start2 + sizeofChromosome;

    if (end2 < (sizeofChromosome * sizeofPopulation)) {
        // Perform crossover
        Crossover(chromosome, sizeofChromosome, start1, end1, start2, end2, mid);
    }

    int number = static_cast<int>(generateRandomc(globalState) * 100);
    if (number < (prob * 100)) {
        int j = static_cast<int>(generateRandomc(globalState) * (sizeofChromosome / 4));
        for (int k = 0; k < j; k++) {
            int index = static_cast<int>(generateRandomc(globalState) * sizeofChromosome);
            // Randomly mutate the chromosome
            chromosome[index] = range[static_cast<int>(generateRandomc(globalState) * sizeofChromosome)];
        }
    }
}