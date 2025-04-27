#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gaussKde1D ( const int dim, const int nd, const int nb, const int Indx, const float *hh, const float *a, const float *b, float *pdf ) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int j = threadIdx.y + blockDim.y * blockIdx.y;
    if ( i < nb && j < nd ) {  // Ensure index bounds
        int ij = i + j * nb;
        float h = hh[Indx];
        float diff = a[Indx + j * dim] - b[Indx + i * dim];  // Precompute difference
        float expTerm = expf(-0.5 * (diff * diff) / (h * h));  // Simplify calculation
        pdf[ij] = expTerm / (h * sqrtf(2 * PI));  // Simplify denominator
    }
}