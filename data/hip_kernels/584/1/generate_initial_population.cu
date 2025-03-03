#include "hip/hip_runtime.h"
#include "includes.h"





__global__ void generate_initial_population(const unsigned int genes_len, unsigned char* all_genes, unsigned int seed) {
// cada thread se encarga de generarse a si mismo y colocarse en memoria principal de GPU.
int globalIndex = blockIdx.x * blockDim.x + threadIdx.x; // indice del individuo/thread
/* CUDA's random number library uses hiprandState_t to keep track of the seed value
we will store a random state for every thread  */
hiprandState_t state;
hiprand_init(seed, /* the seed controls the sequence of random values that are produced */
(globalIndex + 1), /* the sequence number is only important with multiple cores */
genes_len, /* the offset is how much extra we advance in the sequence for each call, can be 0 */
&state);

for (int geneIndex = 0; geneIndex < genes_len; geneIndex++) {
/* we have to initialize the state */

// se debe poder optimizar
/* hiprand works like rand - except that it takes a state as a parameter */
unsigned int result = hiprand(&state);
all_genes[geneIndex + globalIndex * genes_len] = (unsigned char) result
% 256; // write in global device memory
}
}