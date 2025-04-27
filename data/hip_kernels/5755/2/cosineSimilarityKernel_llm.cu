#include "hip/hip_runtime.h"
#include "includes.h"

#define NUMBER_OF_BLOCKS 256
#define NUMBER_OF_THREADS 64

// ==========
// Macro taken from:
// https://stackoverflow.com/questions/14038589/what-is-the-canonical-way-to-check-for-errors-using-the-cuda-runtime-api
__device__ int getElementsPerUnit(int total, int number_of_units) {
    int elements_per_unit = total / number_of_units;
    double remains = total % number_of_units;

    if(remains != 0) {
        elements_per_unit += 1;
    }

    return elements_per_unit;
}

__global__ void cosineSimilarityKernel(double *dot_products, int a_size, int b_size, double *a_norms, double *b_norms, double *results) {
    int a_vectors_per_block = getElementsPerUnit(a_size, gridDim.x);
    int b_vectors_per_thread = getElementsPerUnit(b_size, blockDim.x);

    int a_start = blockIdx.x * a_vectors_per_block;
    int a_end = min(a_start + a_vectors_per_block, a_size);  // Use min to simplify boundary check

    int b_start = threadIdx.x * b_vectors_per_thread;
    int b_end = min(b_start + b_vectors_per_thread, b_size); // Use min to simplify boundary check

    for(int a_index = a_start; a_index < a_end; a_index++) {
        for(int b_index = b_start; b_index < b_end; b_index++) {
            double a_norm = a_norms[a_index];  // Cache a_norm
            double b_norm = b_norms[b_index];  // Cache b_norm
            results[a_index * b_size + b_index] = dot_products[a_index * b_size + b_index] / (a_norm * b_norm);
        }
    }
}