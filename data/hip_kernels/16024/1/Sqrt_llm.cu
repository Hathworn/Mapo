#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

#define D 3
#define N 200
#define K 512
#define Nt 20
#define Rt 0.1f
#define c 0.001f
#define ct 0.0001f

__global__ void Sqrt(float* Q, float* P, float* Qt, float* Pt, float* Eg, float* Epg) {
    int x = blockIdx.x;
    int y = threadIdx.x;
    int i = x * K * D + y * D;
    
    // Optimization: Unroll the loop manually for efficiency
    Q[i] = 0.01f;
    Qt[i] = 0.6f;
    P[i] = 0.3f;
    Pt[i] = 0.5f;
    
    Q[i + 1] = 0.01f;
    Qt[i + 1] = 0.6f;
    P[i + 1] = 0.3f;
    Pt[i + 1] = 0.5f;
    
    Q[i + 2] = 0.01f;
    Qt[i + 2] = 0.6f;
    P[i + 2] = 0.3f;
    Pt[i + 2] = 0.5f;
    
    // Reduce redundant calculations by directly accessing the index
    Epg[i / D] = 100000;
    Eg[i / D] = 0.5f;
}