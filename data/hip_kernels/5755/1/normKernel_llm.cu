#include "hip/hip_runtime.h"
#include "includes.h"

#define NUMBER_OF_BLOCKS 256
#define NUMBER_OF_THREADS 64

__device__ int getElementsPerUnit(int total, int number_of_units) {
    int elements_per_unit = total / number_of_units;
    double remains = total % number_of_units;

    if(remains != 0) {
        elements_per_unit += 1;
    }

    return elements_per_unit;
}

__global__ void normKernel(double *vectors, int size, double *results, int vector_size) {
    int vectors_per_block = getElementsPerUnit(size, gridDim.x);

    // Get flat thread id
    int thread_id = blockIdx.x * blockDim.x + threadIdx.x;
    int total_threads = blockDim.x * gridDim.x;

    // Distribute workload among threads
    for(int vec_index = thread_id; vec_index < size; vec_index += total_threads) {
        double sum = 0.0;
        for(int i = 0; i < vector_size; i++) {
            sum += vectors[vec_index * vector_size + i] * vectors[vec_index * vector_size + i];
        }
        results[vec_index] = sqrt(sum); // Calculate norm
    }
}