#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void solve_GPU(int a, int b, int c ,int *x1, int *x2)
{
    // Calculate common values once to avoid repeated computation
    int raiz = b * b - 4 * a * c;
    int i = -b;
    int j = 2 * a;
    float sqrt_raiz = sqrtf(raiz);

    // Compute the solutions using precomputed values
    *x1 = (i + sqrt_raiz) / j;
    *x2 = (i - sqrt_raiz) / j;
}