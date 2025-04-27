#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#define N 100000 // number of input values
#define R 100    // reduction factor
#define F (1+((N-1)/R)) // how many values will be in the final output

__global__ void basicRun(double *a, double *z) {
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    if (tid >= F) return; // Correct bounds check to be inclusive of F
    double avg = 0.0;
    
    // Unroll loop for performance improvement
    #pragma unroll
    for (int i = 0; i < R; i++) {
        avg += a[i + tid * R];
    }

    z[tid] = avg / R; // Divide sum by total number of input values to get average
}