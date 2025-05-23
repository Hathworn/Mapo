#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

#define MAX_N_TERMS 10

__global__ void MC_Integratev1(float* degrees, int dimension, int n_terms, float* I_val, hiprandState *states, long int seed, int thread_max_iterations)
{
    // Get the Global ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    float I = 0.0f;
    float f[MAX_N_TERMS];

    // Initialize the random number generator
    hiprand_init(seed, id, 0, &states[id]);

    for (int iter_count = 0; iter_count < thread_max_iterations; iter_count++) {
        // Initialize f with the coefficients
        for (int term_i = 0; term_i < n_terms; term_i++) {
            f[term_i] = degrees[(2 + term_i) * dimension];
        }

        for (int d = 1; d < dimension; d++) {
            // Generate a random number and scale it to the range of the limits of this dimension
            float x = hiprand_uniform(&states[id]); // x between 0 and 1
            x = x * (degrees[1 * dimension + d] - degrees[0 * dimension + d]) + degrees[0 * dimension + d];
            
            for (int term_i = 0; term_i < n_terms; term_i++) {
                // Use fast math operation
                f[term_i] *= __powf(x, degrees[(2 + term_i) * dimension + d]); // Use __powf for better performance
            }
        }
        // Accumulate results
        for (int term_i = 0; term_i < n_terms; term_i++) {
            I += f[term_i];
        }
    }
    // Atomic addition to prevent race conditions
    atomicAdd(I_val, I);
}