#include "hip/hip_runtime.h"
#include "includes.h"

#define tam 1.0
#define dx 0.00001
#define dt 0.000001
#define T 0.01
#define kappa 0.000045

__global__ void Inicializacao(double *uprev, const int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate the position only if within valid index range for optimization.
    if (idx <= n) {
        double x = idx * dx;
        // Use ternary operator for cleaner condition assignment.
        uprev[idx] = (x <= 0.5) ? (200 * x) : (200 * (1.0 - x));
    }
}