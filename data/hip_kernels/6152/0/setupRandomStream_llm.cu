#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;

#define THREADS_PER_BLOCK 32
#define NUM_BLOCKS 32

typedef double HighlyPrecise;

const int GENOME_LENGTH = 14;
const int GENE_MAX = 1;

const float MUTATION_FACTOR = 0.2;
const float CROSSOVER_RATE = 0.6;

const int NUM_EPOCHS = 1000;

struct Chromosome {
    HighlyPrecise genes[GENOME_LENGTH];
    HighlyPrecise fitnessValue;
};

// Optimize global kernel
__global__ void setupRandomStream(unsigned int seed, hiprandState* states) {
    // Use grid-stride loop for better resource utilization
    int threadIndex = blockDim.x * blockIdx.x + threadIdx.x; 
    int stride = blockDim.x * gridDim.x;
    for (int i = threadIndex; i < NUM_BLOCKS * THREADS_PER_BLOCK; i += stride) {
        hiprand_init(seed, i, 0, &states[i]);
    }
}