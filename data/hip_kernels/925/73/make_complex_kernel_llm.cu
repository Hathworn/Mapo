#include "hip/hip_runtime.h"
#include "includes.h"

__device__ double2 make_complex(double in, int evolution_type) {
    double2 result;

    switch(evolution_type) {
        case 0: // No change
            result.x = in;
            result.y = 0;
            break;
        case 1: // Im. Time evolution
            result.x = exp(-in);
            result.y = 0;
            break;
        case 2: // Real Time evolution
            result.x = cos(-in);
            result.y = sin(-in);
            break;
    }

    return result;
}

__global__ void make_complex_kernel(double *in, int *evolution_type, double2 *out) {
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Ensure thread does not exceed array bounds
    if (id < 3) {
        out[id] = make_complex(in[id], evolution_type[id]);
    }
}