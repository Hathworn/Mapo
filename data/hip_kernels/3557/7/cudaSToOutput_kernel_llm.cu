#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSToOutput_kernel( unsigned int nbProposals, const unsigned int scoreIdx, const unsigned int nbCls, const unsigned int nbOutputs, const unsigned int maxParts, const unsigned int maxTemplates, bool generateParts, bool generateTemplates, const unsigned int* numPartsPerClass, const unsigned int* numTemplatesPerClass, const int* maxCls, const float* inputs, const int* predictionIndex, const float* partsPrediction, const float* partsVisibilityPrediction, const float* templatesPrediction, float* outputs)
{
    const int batchPos = blockIdx.z*nbProposals;
    const int index = (threadIdx.x & 0x1f) + blockIdx.x*blockDim.x;

    if(index < nbProposals)
    {
        // Precompute common indices to reduce redundancy
        const unsigned int inputIdxBase = index * 4 * (nbCls - scoreIdx) + batchPos * 4 * (nbCls - scoreIdx);
        unsigned int outputIdx = 0;
        unsigned int offset = 4; 
        
        // Streamline computation for outputIdx based on conditions 
        if (nbOutputs == 4) {
            outputIdx = index * 4 + batchPos * 4;
        }
        else if (nbOutputs == 5) {
            outputIdx = index * 5 + batchPos * 5;
        }
        else {
            outputIdx = (index + batchPos) * (5 + (generateParts ? maxParts*3 : 0) + (generateTemplates ? maxTemplates*3 : 0));
        }

        // Store common output data
        for(int i = 0; i < 4; ++i) {
            outputs[i + outputIdx] = inputs[i + inputIdxBase];
        }

        if (nbOutputs > 4) {
            int cls = maxCls[index + batchPos];
            outputs[4 + outputIdx] = cls > -1 ? static_cast<float>(cls) : 0.0;
            offset += 1;
        }

        if (generateParts) {
            const int predProp = predictionIndex[(index + batchPos) * 2];
            const int predCls = predictionIndex[(index + batchPos) * 2 + 1];

            if (predCls > -1) {
                unsigned int partBase = batchPos * maxParts * 2 * nbCls + predProp * maxParts * 2 * nbCls + predCls * maxParts * 2;
                for (unsigned int part = 0; part < numPartsPerClass[predCls]; ++part) {
                    for (int j = 0; j < 2; ++j) {
                        outputs[j + offset + part * 2 + outputIdx] = partsPrediction[j + partBase + part * 2];
                    }
                }
                for (int idx = numPartsPerClass[predCls]; idx < maxParts; ++idx) {
                    for (int j = 0; j < 2; ++j) {
                        outputs[j + offset + numPartsPerClass[predCls] * 2 + idx * 2 + outputIdx] = 0.0;
                    }
                }
            }
            offset += maxParts * 2;

            if (predCls > -1) {
                unsigned int partVisibilityBase = batchPos * maxParts * nbCls + predProp * maxParts * nbCls + predCls * maxParts;
                for (unsigned int part = 0; part < numPartsPerClass[predCls]; ++part) {
                    outputs[offset + part + outputIdx] = partsVisibilityPrediction[partVisibilityBase + part];
                }
                for (int idx = numPartsPerClass[predCls]; idx < maxParts; ++idx) {
                    outputs[offset + numPartsPerClass[predCls] + idx + outputIdx] = -1.0;
                }
            }
            offset += maxParts;
        }

        if (generateTemplates) {
            const int predProp = predictionIndex[(index + batchPos) * 2];
            const int predCls = predictionIndex[(index + batchPos) * 2 + 1];

            if (predCls > -1) {
                unsigned int templateBase = batchPos * maxTemplates * 3 * nbCls + predProp * maxTemplates * 3 * nbCls + predCls * maxTemplates * 3;
                for (unsigned int tpl = 0; tpl < numTemplatesPerClass[predCls]; ++tpl) {
                    for (int j = 0; j < 3; ++j) {
                        outputs[j + offset + tpl * 3 + outputIdx] = templatesPrediction[j + templateBase + tpl * 3];
                    }
                }
                for (int idx = numTemplatesPerClass[predCls]; idx < maxTemplates; ++idx) {
                    for (int j = 0; j < 3; ++j) {
                        outputs[j + offset + numTemplatesPerClass[predCls] * 3 + idx * 3 + outputIdx] = 0.0;
                    }
                }
            }
        }
    }
}