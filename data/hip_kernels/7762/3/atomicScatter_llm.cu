#include "hip/hip_runtime.h"
#include "includes.h"

# define PI 3.14159265358979323846

__global__ void atomicScatter(int type1, int type2, int size_K, double *occ, double *beq, double *K, double *a, double *b, double *c, double *ffoobb) {
    // Calculate thread index
    int Idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Process only valid thread indices
    if (Idx < size_K) {
        double rp16pi2 = -0.006332573977646;
        double negativeHalfSquaredS = K[Idx] * K[Idx] * rp16pi2;
        
        // Prefactor calculation
        double occupationFactor = occ[type1] * occ[type2];
        double debyeWallerFactor = exp(negativeHalfSquaredS * (beq[type1] + beq[type2]));
        ffoobb[Idx] = occupationFactor * debyeWallerFactor;

        // Use variables for repeated access
        double negK2S = K[Idx] * K[Idx];
        double f1 = c[type1];
        double f2 = c[type2];

        // Loop unrolling for better performance
        for (int i = 0; i < 5; i++) {
            double expFactor = exp(b[type1 * 5 + i] * negativeHalfSquaredS);
            f1 += a[type1 * 5 + i] * expFactor;
            expFactor = exp(b[type2 * 5 + i] * negativeHalfSquaredS);
            f2 += a[type2 * 5 + i] * expFactor;
        }
        
        // Final prefactor multiplication
        ffoobb[Idx] *= f1 * f2;
    }
}