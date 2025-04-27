#include "hip/hip_runtime.h"
#include "includes.h"
#define L2HYS_EPSILON 		0.01f
#define L2HYS_EPSILONHYS	1.0f
#define L2HYS_CLIP			0.2f
#define data_h2y            30

// Optimized kernel function
__global__ void smooth(float *in, float *out)
{
    int k = blockIdx.x;  // Use blockIdx for iteration over k
    int j = blockIdx.y;  // Use blockIdx for iteration over j
    int m_nBIN = 10;
    float *m_pCellFeatures = in;
    int t_nLineWidth = 70;
    float t_pTemp[10];

    // Process i within threads
    int i = threadIdx.x;
    if (i < m_nBIN) {
        int t_nLeft = (i - 1 + m_nBIN) % m_nBIN;
        int t_nRight = (i + 1) % m_nBIN;

        // Use registers for accessing elements
        float center = m_pCellFeatures[k * t_nLineWidth + j * m_nBIN + i];
        float left = m_pCellFeatures[k * t_nLineWidth + j * m_nBIN + t_nLeft];
        float right = m_pCellFeatures[k * t_nLineWidth + j * m_nBIN + t_nRight];

        t_pTemp[i] = center * 0.8f + left * 0.1f + right * 0.1f;
    }

    __syncthreads();

    if (i < m_nBIN)
    {
        out[k * t_nLineWidth + j * m_nBIN + i] = t_pTemp[i];
    }
}