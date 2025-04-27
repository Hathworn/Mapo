#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void prova3() {
    // Optimize memory access by using shared memory
    __shared__ int shared_output[32];

    // Assuming NQfrontier is a function that can be optimized further for better thread cooperativity
    auto A = NQfrontier<32>(F_array, 5, Adj_array);

    // Store results in shared memory to minimize global memory access
    for (auto it : A) {
        shared_output[threadIdx.x] = it.start;
        // Print output for debugging purposes (Comment out in release)
        // printf("threadIdx.x %d \t %d\n", threadIdx.x, it.end);
    }

    // Write results from shared memory to global output if needed
    Ouptput[threadIdx.x] = shared_output[threadIdx.x];
    // Debug statement to check the start of the first element
    // printf("threadIdx.x %d \t %d\n", threadIdx.x, (*A.begin()).start);
}