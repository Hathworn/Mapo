#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c, int *d, int *e, int *f) {
    int valA = *a; // Load values from global memory once for efficiency
    int valB = *b;
    
    *c = valA + valB; // Compute sum
    *d = valA - valB; // Compute difference
    *e = valA * valB; // Compute product
    
    if (valB != 0) { // Check to avoid division by zero
        *f = valA / valB; // Compute quotient
    }
}