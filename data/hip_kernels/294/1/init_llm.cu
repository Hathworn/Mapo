#include "hip/hip_runtime.h"
#include "includes.h"

const int CHUNKS = 64;
const int GENERATIONS = 10;

const int CHECK_VALUES_EVERY = 50000;
const int SHOW_ALL_VALUES = 0;
const int SKIP_CUDA_DEVICE = false;

const int ISLANDS_PER_ROW = 4;
const int GENOME_LENGTH = 4;
const int BLOCKS_PER_ROW = 4;
const int ISLAND_POPULATION = 100;
const int SELECTION_COUNT = 80;
const float MUTATION_CHANCE = 0.8;
const int ITEMS_MAX_WEIGHT = 5;
const int ITEMS_MAX_VALUE = 20;
const int ITEMS_MAX = 20;

__global__ void init(unsigned int seed, hiprandState_t* states) {
  // Simplify state initialization using linear indexing
  int id = blockDim.x * blockIdx.x + threadIdx.x; // Compute unique index for each thread
  hiprand_init(seed, id, 0, &states[id]); // Initialize with unique sequence number
}