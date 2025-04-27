#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pnpolyGPU(const float *vertex, float testx, float testy, int* results)
{
    int id = blockIdx.x;

    // Calculate indices using local variables to reduce redundant calculations
    int indexOrigin = (blockIdx.x + 1) * 3;
    int indexDestino = blockIdx.x * 3;

    float vertexOriginX = vertex[indexOrigin];
    float vertexOriginY = vertex[indexOrigin + 1];
    float vertexDestinoX = vertex[indexDestino];
    float vertexDestinoY = vertex[indexDestino + 1];

    // Utilize logical operators efficiently
    bool condition = ((vertexOriginY > testy) != (vertexDestinoY > testy)) &&
                     (testx < (vertexDestinoX - vertexOriginX) * 
                     (testy - vertexOriginY) / (vertexDestinoY - vertexOriginY) + vertexOriginX);
    
    results[id] = condition ? 1 : 0;
}