#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

// Optimized kernel: Reduce global memory operations and redundant calculations.
__global__ void AddIntsCUDA(int* a, int* b) {
    int local_b = b[0]; // Load b[0] once into a register
    int local_a = a[0]; // Load a[0] once into a register
    
    for (int i = 0; i < 12000000; i++) {
        local_a += local_b; // Use register variables for computation
    }
    
    a[0] = local_a; // Write the result back to global memory once
}