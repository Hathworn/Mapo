#include "hip/hip_runtime.h"
#include "includes.h"
#include <hiprand_kernel.h>  // Ensure hiprand functions are available

__global__ void generate_initial_population(const unsigned int genes_len, unsigned char* all_genes, unsigned int seed) {
    int globalIndex = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global index
    hiprandState_t state;
    hiprand_init(seed, globalIndex, 0, &state);  // Initialize random state with offset 0

    int offset = globalIndex * genes_len;  // Pre-calculate memory offset
    for (int geneIndex = 0; geneIndex < genes_len; geneIndex++) {
        // Generate a random number and store directly into memory
        all_genes[offset + geneIndex] = hiprand(&state) % 256;
    }
}