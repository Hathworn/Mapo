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

__global__ void NextQTur(float* Qt, float* Pt) {
    int i = threadIdx.x;
    int index = i * D; // Calculate the starting index for the current thread
    // Update Qt with Pt values scaled by ct
    Qt[index] += Pt[index] * ct;
    Qt[index + 1] += Pt[index + 1] * ct;
    Qt[index + 2] += Pt[index + 2] * ct;
}