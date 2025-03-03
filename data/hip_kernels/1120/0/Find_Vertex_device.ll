; ModuleID = '../data/hip_kernels/1120/0/main.cu'
source_filename = "../data/hip_kernels/1120/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.Vertex = type { i32, i32 }
%struct.Edge = type { i32, i32 }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11Find_VertexP6VertexP4EdgePiS3_S3_(%struct.Vertex addrspace(1)* nocapture %0, %struct.Edge addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = zext i32 %6 to i64
  %8 = getelementptr inbounds %struct.Vertex, %struct.Vertex addrspace(1)* %0, i64 %7, i32 1
  %9 = load i32, i32 addrspace(1)* %8, align 4, !tbaa !5, !amdgpu.noclobber !10
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %712

11:                                               ; preds = %5
  store i32 1, i32 addrspace(1)* %8, align 4, !tbaa !5
  %12 = getelementptr inbounds %struct.Vertex, %struct.Vertex addrspace(1)* %0, i64 %7, i32 0
  %13 = getelementptr inbounds %struct.Edge, %struct.Edge addrspace(1)* %1, i64 0, i32 0
  %14 = getelementptr inbounds %struct.Edge, %struct.Edge addrspace(1)* %1, i64 0, i32 1
  %15 = getelementptr inbounds %struct.Edge, %struct.Edge addrspace(1)* %1, i64 1, i32 0
  %16 = getelementptr inbounds %struct.Edge, %struct.Edge addrspace(1)* %1, i64 1, i32 1
  %17 = getelementptr inbounds %struct.Edge, %struct.Edge addrspace(1)* %1, i64 2, i32 0
  %18 = getelementptr inbounds %struct.Edge, %struct.Edge addrspace(1)* %1, i64 2, i32 1
  %19 = getelementptr inbounds %struct.Edge, %struct.Edge addrspace(1)* %1, i64 3, i32 0
  %20 = getelementptr inbounds %struct.Edge, %struct.Edge addrspace(1)* %1, i64 3, i32 1
  %21 = getelementptr inbounds %struct.Edge, %struct.Edge addrspace(1)* %1, i64 4, i32 0
  %22 = getelementptr inbounds %struct.Edge, %struct.Edge addrspace(1)* %1, i64 4, i32 1
  %23 = getelementptr inbounds %struct.Edge, %struct.Edge addrspace(1)* %1, i64 5, i32 0
  %24 = getelementptr inbounds %struct.Edge, %struct.Edge addrspace(1)* %1, i64 5, i32 1
  %25 = getelementptr inbounds %struct.Edge, %struct.Edge addrspace(1)* %1, i64 6, i32 0
  %26 = getelementptr inbounds %struct.Edge, %struct.Edge addrspace(1)* %1, i64 6, i32 1
  %27 = getelementptr inbounds %struct.Edge, %struct.Edge addrspace(1)* %1, i64 7, i32 0
  %28 = getelementptr inbounds %struct.Edge, %struct.Edge addrspace(1)* %1, i64 7, i32 1
  %29 = getelementptr inbounds %struct.Edge, %struct.Edge addrspace(1)* %1, i64 8, i32 0
  %30 = getelementptr inbounds %struct.Edge, %struct.Edge addrspace(1)* %1, i64 8, i32 1
  %31 = getelementptr inbounds %struct.Edge, %struct.Edge addrspace(1)* %1, i64 9, i32 0
  %32 = getelementptr inbounds %struct.Edge, %struct.Edge addrspace(1)* %1, i64 9, i32 1
  %33 = getelementptr inbounds %struct.Edge, %struct.Edge addrspace(1)* %1, i64 10, i32 0
  %34 = getelementptr inbounds %struct.Edge, %struct.Edge addrspace(1)* %1, i64 10, i32 1
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %7
  %36 = load i32, i32 addrspace(1)* %12, align 4, !tbaa.struct !11
  %37 = getelementptr inbounds %struct.Vertex, %struct.Vertex addrspace(1)* %0, i64 0, i32 0
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa.struct !11
  %39 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !13
  %40 = icmp eq i32 %39, %36
  br i1 %40, label %41, label %48

41:                                               ; preds = %11
  %42 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !15
  %43 = icmp eq i32 %42, %38
  br i1 %43, label %44, label %48

44:                                               ; preds = %105, %99, %93, %87, %81, %75, %69, %63, %57, %51, %41
  %45 = phi i64 [ 0, %41 ], [ 1, %51 ], [ 2, %57 ], [ 3, %63 ], [ 4, %69 ], [ 5, %75 ], [ 6, %81 ], [ 7, %87 ], [ 8, %93 ], [ 9, %99 ], [ 10, %105 ]
  %46 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %45
  %47 = load i32, i32 addrspace(1)* %46, align 4, !tbaa !12
  br label %108

48:                                               ; preds = %41, %11
  %49 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !13
  %50 = icmp eq i32 %49, %36
  br i1 %50, label %51, label %54

51:                                               ; preds = %48
  %52 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !15
  %53 = icmp eq i32 %52, %38
  br i1 %53, label %44, label %54

54:                                               ; preds = %51, %48
  %55 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !13
  %56 = icmp eq i32 %55, %36
  br i1 %56, label %57, label %60

57:                                               ; preds = %54
  %58 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !15
  %59 = icmp eq i32 %58, %38
  br i1 %59, label %44, label %60

60:                                               ; preds = %57, %54
  %61 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !13
  %62 = icmp eq i32 %61, %36
  br i1 %62, label %63, label %66

63:                                               ; preds = %60
  %64 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !15
  %65 = icmp eq i32 %64, %38
  br i1 %65, label %44, label %66

66:                                               ; preds = %63, %60
  %67 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !13
  %68 = icmp eq i32 %67, %36
  br i1 %68, label %69, label %72

69:                                               ; preds = %66
  %70 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !15
  %71 = icmp eq i32 %70, %38
  br i1 %71, label %44, label %72

72:                                               ; preds = %69, %66
  %73 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !13
  %74 = icmp eq i32 %73, %36
  br i1 %74, label %75, label %78

75:                                               ; preds = %72
  %76 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !15
  %77 = icmp eq i32 %76, %38
  br i1 %77, label %44, label %78

78:                                               ; preds = %75, %72
  %79 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !13
  %80 = icmp eq i32 %79, %36
  br i1 %80, label %81, label %84

81:                                               ; preds = %78
  %82 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !15
  %83 = icmp eq i32 %82, %38
  br i1 %83, label %44, label %84

84:                                               ; preds = %81, %78
  %85 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !13
  %86 = icmp eq i32 %85, %36
  br i1 %86, label %87, label %90

87:                                               ; preds = %84
  %88 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !15
  %89 = icmp eq i32 %88, %38
  br i1 %89, label %44, label %90

90:                                               ; preds = %87, %84
  %91 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !13
  %92 = icmp eq i32 %91, %36
  br i1 %92, label %93, label %96

93:                                               ; preds = %90
  %94 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !15
  %95 = icmp eq i32 %94, %38
  br i1 %95, label %44, label %96

96:                                               ; preds = %93, %90
  %97 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !13
  %98 = icmp eq i32 %97, %36
  br i1 %98, label %99, label %102

99:                                               ; preds = %96
  %100 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !15
  %101 = icmp eq i32 %100, %38
  br i1 %101, label %44, label %102

102:                                              ; preds = %99, %96
  %103 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !13
  %104 = icmp eq i32 %103, %36
  br i1 %104, label %105, label %108

105:                                              ; preds = %102
  %106 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !15
  %107 = icmp eq i32 %106, %38
  br i1 %107, label %44, label %108

108:                                              ; preds = %44, %102, %105
  %109 = phi i32 [ %47, %44 ], [ 1000000, %105 ], [ 1000000, %102 ]
  %110 = icmp slt i32 %109, 1000000
  br i1 %110, label %111, label %119

111:                                              ; preds = %108
  %112 = load i32, i32 addrspace(1)* %4, align 4, !tbaa !12
  %113 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !12
  %114 = add nsw i32 %113, %109
  %115 = icmp sgt i32 %112, %114
  br i1 %115, label %116, label %119

116:                                              ; preds = %111
  store i32 %114, i32 addrspace(1)* %4, align 4, !tbaa !12
  %117 = load i32, i32 addrspace(1)* %12, align 4, !tbaa.struct !11
  %118 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !13
  br label %119

119:                                              ; preds = %111, %116, %108
  %120 = phi i32 [ %39, %111 ], [ %118, %116 ], [ %39, %108 ]
  %121 = phi i32 [ %36, %111 ], [ %117, %116 ], [ %36, %108 ]
  %122 = getelementptr inbounds %struct.Vertex, %struct.Vertex addrspace(1)* %0, i64 1, i32 0
  %123 = load i32, i32 addrspace(1)* %122, align 4, !tbaa.struct !11
  %124 = icmp eq i32 %120, %121
  br i1 %124, label %125, label %128

125:                                              ; preds = %119
  %126 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !15
  %127 = icmp eq i32 %126, %123
  br i1 %127, label %188, label %128

128:                                              ; preds = %125, %119
  %129 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !13
  %130 = icmp eq i32 %129, %121
  br i1 %130, label %131, label %134

131:                                              ; preds = %128
  %132 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !15
  %133 = icmp eq i32 %132, %123
  br i1 %133, label %188, label %134

134:                                              ; preds = %131, %128
  %135 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !13
  %136 = icmp eq i32 %135, %121
  br i1 %136, label %137, label %140

137:                                              ; preds = %134
  %138 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !15
  %139 = icmp eq i32 %138, %123
  br i1 %139, label %188, label %140

140:                                              ; preds = %137, %134
  %141 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !13
  %142 = icmp eq i32 %141, %121
  br i1 %142, label %143, label %146

143:                                              ; preds = %140
  %144 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !15
  %145 = icmp eq i32 %144, %123
  br i1 %145, label %188, label %146

146:                                              ; preds = %143, %140
  %147 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !13
  %148 = icmp eq i32 %147, %121
  br i1 %148, label %149, label %152

149:                                              ; preds = %146
  %150 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !15
  %151 = icmp eq i32 %150, %123
  br i1 %151, label %188, label %152

152:                                              ; preds = %149, %146
  %153 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !13
  %154 = icmp eq i32 %153, %121
  br i1 %154, label %155, label %158

155:                                              ; preds = %152
  %156 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !15
  %157 = icmp eq i32 %156, %123
  br i1 %157, label %188, label %158

158:                                              ; preds = %155, %152
  %159 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !13
  %160 = icmp eq i32 %159, %121
  br i1 %160, label %161, label %164

161:                                              ; preds = %158
  %162 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !15
  %163 = icmp eq i32 %162, %123
  br i1 %163, label %188, label %164

164:                                              ; preds = %161, %158
  %165 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !13
  %166 = icmp eq i32 %165, %121
  br i1 %166, label %167, label %170

167:                                              ; preds = %164
  %168 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !15
  %169 = icmp eq i32 %168, %123
  br i1 %169, label %188, label %170

170:                                              ; preds = %167, %164
  %171 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !13
  %172 = icmp eq i32 %171, %121
  br i1 %172, label %173, label %176

173:                                              ; preds = %170
  %174 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !15
  %175 = icmp eq i32 %174, %123
  br i1 %175, label %188, label %176

176:                                              ; preds = %173, %170
  %177 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !13
  %178 = icmp eq i32 %177, %121
  br i1 %178, label %179, label %182

179:                                              ; preds = %176
  %180 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !15
  %181 = icmp eq i32 %180, %123
  br i1 %181, label %188, label %182

182:                                              ; preds = %179, %176
  %183 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !13
  %184 = icmp eq i32 %183, %121
  br i1 %184, label %185, label %192

185:                                              ; preds = %182
  %186 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !15
  %187 = icmp eq i32 %186, %123
  br i1 %187, label %188, label %192

188:                                              ; preds = %185, %179, %173, %167, %161, %155, %149, %143, %137, %131, %125
  %189 = phi i64 [ 0, %125 ], [ 1, %131 ], [ 2, %137 ], [ 3, %143 ], [ 4, %149 ], [ 5, %155 ], [ 6, %161 ], [ 7, %167 ], [ 8, %173 ], [ 9, %179 ], [ 10, %185 ]
  %190 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %189
  %191 = load i32, i32 addrspace(1)* %190, align 4, !tbaa !12
  br label %192

192:                                              ; preds = %188, %185, %182
  %193 = phi i32 [ %191, %188 ], [ 1000000, %185 ], [ 1000000, %182 ]
  %194 = icmp slt i32 %193, 1000000
  br i1 %194, label %195, label %204

195:                                              ; preds = %192
  %196 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 1
  %197 = load i32, i32 addrspace(1)* %196, align 4, !tbaa !12
  %198 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !12
  %199 = add nsw i32 %198, %193
  %200 = icmp sgt i32 %197, %199
  br i1 %200, label %201, label %204

201:                                              ; preds = %195
  store i32 %199, i32 addrspace(1)* %196, align 4, !tbaa !12
  %202 = load i32, i32 addrspace(1)* %12, align 4, !tbaa.struct !11
  %203 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !13
  br label %204

204:                                              ; preds = %201, %195, %192
  %205 = phi i32 [ %203, %201 ], [ %120, %195 ], [ %120, %192 ]
  %206 = phi i32 [ %202, %201 ], [ %121, %195 ], [ %121, %192 ]
  %207 = getelementptr inbounds %struct.Vertex, %struct.Vertex addrspace(1)* %0, i64 2, i32 0
  %208 = load i32, i32 addrspace(1)* %207, align 4, !tbaa.struct !11
  %209 = icmp eq i32 %205, %206
  br i1 %209, label %210, label %213

210:                                              ; preds = %204
  %211 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !15
  %212 = icmp eq i32 %211, %208
  br i1 %212, label %273, label %213

213:                                              ; preds = %210, %204
  %214 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !13
  %215 = icmp eq i32 %214, %206
  br i1 %215, label %216, label %219

216:                                              ; preds = %213
  %217 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !15
  %218 = icmp eq i32 %217, %208
  br i1 %218, label %273, label %219

219:                                              ; preds = %216, %213
  %220 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !13
  %221 = icmp eq i32 %220, %206
  br i1 %221, label %222, label %225

222:                                              ; preds = %219
  %223 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !15
  %224 = icmp eq i32 %223, %208
  br i1 %224, label %273, label %225

225:                                              ; preds = %222, %219
  %226 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !13
  %227 = icmp eq i32 %226, %206
  br i1 %227, label %228, label %231

228:                                              ; preds = %225
  %229 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !15
  %230 = icmp eq i32 %229, %208
  br i1 %230, label %273, label %231

231:                                              ; preds = %228, %225
  %232 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !13
  %233 = icmp eq i32 %232, %206
  br i1 %233, label %234, label %237

234:                                              ; preds = %231
  %235 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !15
  %236 = icmp eq i32 %235, %208
  br i1 %236, label %273, label %237

237:                                              ; preds = %234, %231
  %238 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !13
  %239 = icmp eq i32 %238, %206
  br i1 %239, label %240, label %243

240:                                              ; preds = %237
  %241 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !15
  %242 = icmp eq i32 %241, %208
  br i1 %242, label %273, label %243

243:                                              ; preds = %240, %237
  %244 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !13
  %245 = icmp eq i32 %244, %206
  br i1 %245, label %246, label %249

246:                                              ; preds = %243
  %247 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !15
  %248 = icmp eq i32 %247, %208
  br i1 %248, label %273, label %249

249:                                              ; preds = %246, %243
  %250 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !13
  %251 = icmp eq i32 %250, %206
  br i1 %251, label %252, label %255

252:                                              ; preds = %249
  %253 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !15
  %254 = icmp eq i32 %253, %208
  br i1 %254, label %273, label %255

255:                                              ; preds = %252, %249
  %256 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !13
  %257 = icmp eq i32 %256, %206
  br i1 %257, label %258, label %261

258:                                              ; preds = %255
  %259 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !15
  %260 = icmp eq i32 %259, %208
  br i1 %260, label %273, label %261

261:                                              ; preds = %258, %255
  %262 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !13
  %263 = icmp eq i32 %262, %206
  br i1 %263, label %264, label %267

264:                                              ; preds = %261
  %265 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !15
  %266 = icmp eq i32 %265, %208
  br i1 %266, label %273, label %267

267:                                              ; preds = %264, %261
  %268 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !13
  %269 = icmp eq i32 %268, %206
  br i1 %269, label %270, label %277

270:                                              ; preds = %267
  %271 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !15
  %272 = icmp eq i32 %271, %208
  br i1 %272, label %273, label %277

273:                                              ; preds = %270, %264, %258, %252, %246, %240, %234, %228, %222, %216, %210
  %274 = phi i64 [ 0, %210 ], [ 1, %216 ], [ 2, %222 ], [ 3, %228 ], [ 4, %234 ], [ 5, %240 ], [ 6, %246 ], [ 7, %252 ], [ 8, %258 ], [ 9, %264 ], [ 10, %270 ]
  %275 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %274
  %276 = load i32, i32 addrspace(1)* %275, align 4, !tbaa !12
  br label %277

277:                                              ; preds = %273, %270, %267
  %278 = phi i32 [ %276, %273 ], [ 1000000, %270 ], [ 1000000, %267 ]
  %279 = icmp slt i32 %278, 1000000
  br i1 %279, label %280, label %289

280:                                              ; preds = %277
  %281 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 2
  %282 = load i32, i32 addrspace(1)* %281, align 4, !tbaa !12
  %283 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !12
  %284 = add nsw i32 %283, %278
  %285 = icmp sgt i32 %282, %284
  br i1 %285, label %286, label %289

286:                                              ; preds = %280
  store i32 %284, i32 addrspace(1)* %281, align 4, !tbaa !12
  %287 = load i32, i32 addrspace(1)* %12, align 4, !tbaa.struct !11
  %288 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !13
  br label %289

289:                                              ; preds = %286, %280, %277
  %290 = phi i32 [ %288, %286 ], [ %205, %280 ], [ %205, %277 ]
  %291 = phi i32 [ %287, %286 ], [ %206, %280 ], [ %206, %277 ]
  %292 = getelementptr inbounds %struct.Vertex, %struct.Vertex addrspace(1)* %0, i64 3, i32 0
  %293 = load i32, i32 addrspace(1)* %292, align 4, !tbaa.struct !11
  %294 = icmp eq i32 %290, %291
  br i1 %294, label %295, label %298

295:                                              ; preds = %289
  %296 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !15
  %297 = icmp eq i32 %296, %293
  br i1 %297, label %358, label %298

298:                                              ; preds = %295, %289
  %299 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !13
  %300 = icmp eq i32 %299, %291
  br i1 %300, label %301, label %304

301:                                              ; preds = %298
  %302 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !15
  %303 = icmp eq i32 %302, %293
  br i1 %303, label %358, label %304

304:                                              ; preds = %301, %298
  %305 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !13
  %306 = icmp eq i32 %305, %291
  br i1 %306, label %307, label %310

307:                                              ; preds = %304
  %308 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !15
  %309 = icmp eq i32 %308, %293
  br i1 %309, label %358, label %310

310:                                              ; preds = %307, %304
  %311 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !13
  %312 = icmp eq i32 %311, %291
  br i1 %312, label %313, label %316

313:                                              ; preds = %310
  %314 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !15
  %315 = icmp eq i32 %314, %293
  br i1 %315, label %358, label %316

316:                                              ; preds = %313, %310
  %317 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !13
  %318 = icmp eq i32 %317, %291
  br i1 %318, label %319, label %322

319:                                              ; preds = %316
  %320 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !15
  %321 = icmp eq i32 %320, %293
  br i1 %321, label %358, label %322

322:                                              ; preds = %319, %316
  %323 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !13
  %324 = icmp eq i32 %323, %291
  br i1 %324, label %325, label %328

325:                                              ; preds = %322
  %326 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !15
  %327 = icmp eq i32 %326, %293
  br i1 %327, label %358, label %328

328:                                              ; preds = %325, %322
  %329 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !13
  %330 = icmp eq i32 %329, %291
  br i1 %330, label %331, label %334

331:                                              ; preds = %328
  %332 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !15
  %333 = icmp eq i32 %332, %293
  br i1 %333, label %358, label %334

334:                                              ; preds = %331, %328
  %335 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !13
  %336 = icmp eq i32 %335, %291
  br i1 %336, label %337, label %340

337:                                              ; preds = %334
  %338 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !15
  %339 = icmp eq i32 %338, %293
  br i1 %339, label %358, label %340

340:                                              ; preds = %337, %334
  %341 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !13
  %342 = icmp eq i32 %341, %291
  br i1 %342, label %343, label %346

343:                                              ; preds = %340
  %344 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !15
  %345 = icmp eq i32 %344, %293
  br i1 %345, label %358, label %346

346:                                              ; preds = %343, %340
  %347 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !13
  %348 = icmp eq i32 %347, %291
  br i1 %348, label %349, label %352

349:                                              ; preds = %346
  %350 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !15
  %351 = icmp eq i32 %350, %293
  br i1 %351, label %358, label %352

352:                                              ; preds = %349, %346
  %353 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !13
  %354 = icmp eq i32 %353, %291
  br i1 %354, label %355, label %362

355:                                              ; preds = %352
  %356 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !15
  %357 = icmp eq i32 %356, %293
  br i1 %357, label %358, label %362

358:                                              ; preds = %355, %349, %343, %337, %331, %325, %319, %313, %307, %301, %295
  %359 = phi i64 [ 0, %295 ], [ 1, %301 ], [ 2, %307 ], [ 3, %313 ], [ 4, %319 ], [ 5, %325 ], [ 6, %331 ], [ 7, %337 ], [ 8, %343 ], [ 9, %349 ], [ 10, %355 ]
  %360 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %359
  %361 = load i32, i32 addrspace(1)* %360, align 4, !tbaa !12
  br label %362

362:                                              ; preds = %358, %355, %352
  %363 = phi i32 [ %361, %358 ], [ 1000000, %355 ], [ 1000000, %352 ]
  %364 = icmp slt i32 %363, 1000000
  br i1 %364, label %365, label %374

365:                                              ; preds = %362
  %366 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 3
  %367 = load i32, i32 addrspace(1)* %366, align 4, !tbaa !12
  %368 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !12
  %369 = add nsw i32 %368, %363
  %370 = icmp sgt i32 %367, %369
  br i1 %370, label %371, label %374

371:                                              ; preds = %365
  store i32 %369, i32 addrspace(1)* %366, align 4, !tbaa !12
  %372 = load i32, i32 addrspace(1)* %12, align 4, !tbaa.struct !11
  %373 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !13
  br label %374

374:                                              ; preds = %371, %365, %362
  %375 = phi i32 [ %373, %371 ], [ %290, %365 ], [ %290, %362 ]
  %376 = phi i32 [ %372, %371 ], [ %291, %365 ], [ %291, %362 ]
  %377 = getelementptr inbounds %struct.Vertex, %struct.Vertex addrspace(1)* %0, i64 4, i32 0
  %378 = load i32, i32 addrspace(1)* %377, align 4, !tbaa.struct !11
  %379 = icmp eq i32 %375, %376
  br i1 %379, label %380, label %383

380:                                              ; preds = %374
  %381 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !15
  %382 = icmp eq i32 %381, %378
  br i1 %382, label %443, label %383

383:                                              ; preds = %380, %374
  %384 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !13
  %385 = icmp eq i32 %384, %376
  br i1 %385, label %386, label %389

386:                                              ; preds = %383
  %387 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !15
  %388 = icmp eq i32 %387, %378
  br i1 %388, label %443, label %389

389:                                              ; preds = %386, %383
  %390 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !13
  %391 = icmp eq i32 %390, %376
  br i1 %391, label %392, label %395

392:                                              ; preds = %389
  %393 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !15
  %394 = icmp eq i32 %393, %378
  br i1 %394, label %443, label %395

395:                                              ; preds = %392, %389
  %396 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !13
  %397 = icmp eq i32 %396, %376
  br i1 %397, label %398, label %401

398:                                              ; preds = %395
  %399 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !15
  %400 = icmp eq i32 %399, %378
  br i1 %400, label %443, label %401

401:                                              ; preds = %398, %395
  %402 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !13
  %403 = icmp eq i32 %402, %376
  br i1 %403, label %404, label %407

404:                                              ; preds = %401
  %405 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !15
  %406 = icmp eq i32 %405, %378
  br i1 %406, label %443, label %407

407:                                              ; preds = %404, %401
  %408 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !13
  %409 = icmp eq i32 %408, %376
  br i1 %409, label %410, label %413

410:                                              ; preds = %407
  %411 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !15
  %412 = icmp eq i32 %411, %378
  br i1 %412, label %443, label %413

413:                                              ; preds = %410, %407
  %414 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !13
  %415 = icmp eq i32 %414, %376
  br i1 %415, label %416, label %419

416:                                              ; preds = %413
  %417 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !15
  %418 = icmp eq i32 %417, %378
  br i1 %418, label %443, label %419

419:                                              ; preds = %416, %413
  %420 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !13
  %421 = icmp eq i32 %420, %376
  br i1 %421, label %422, label %425

422:                                              ; preds = %419
  %423 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !15
  %424 = icmp eq i32 %423, %378
  br i1 %424, label %443, label %425

425:                                              ; preds = %422, %419
  %426 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !13
  %427 = icmp eq i32 %426, %376
  br i1 %427, label %428, label %431

428:                                              ; preds = %425
  %429 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !15
  %430 = icmp eq i32 %429, %378
  br i1 %430, label %443, label %431

431:                                              ; preds = %428, %425
  %432 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !13
  %433 = icmp eq i32 %432, %376
  br i1 %433, label %434, label %437

434:                                              ; preds = %431
  %435 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !15
  %436 = icmp eq i32 %435, %378
  br i1 %436, label %443, label %437

437:                                              ; preds = %434, %431
  %438 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !13
  %439 = icmp eq i32 %438, %376
  br i1 %439, label %440, label %447

440:                                              ; preds = %437
  %441 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !15
  %442 = icmp eq i32 %441, %378
  br i1 %442, label %443, label %447

443:                                              ; preds = %440, %434, %428, %422, %416, %410, %404, %398, %392, %386, %380
  %444 = phi i64 [ 0, %380 ], [ 1, %386 ], [ 2, %392 ], [ 3, %398 ], [ 4, %404 ], [ 5, %410 ], [ 6, %416 ], [ 7, %422 ], [ 8, %428 ], [ 9, %434 ], [ 10, %440 ]
  %445 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %444
  %446 = load i32, i32 addrspace(1)* %445, align 4, !tbaa !12
  br label %447

447:                                              ; preds = %443, %440, %437
  %448 = phi i32 [ %446, %443 ], [ 1000000, %440 ], [ 1000000, %437 ]
  %449 = icmp slt i32 %448, 1000000
  br i1 %449, label %450, label %459

450:                                              ; preds = %447
  %451 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 4
  %452 = load i32, i32 addrspace(1)* %451, align 4, !tbaa !12
  %453 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !12
  %454 = add nsw i32 %453, %448
  %455 = icmp sgt i32 %452, %454
  br i1 %455, label %456, label %459

456:                                              ; preds = %450
  store i32 %454, i32 addrspace(1)* %451, align 4, !tbaa !12
  %457 = load i32, i32 addrspace(1)* %12, align 4, !tbaa.struct !11
  %458 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !13
  br label %459

459:                                              ; preds = %456, %450, %447
  %460 = phi i32 [ %458, %456 ], [ %375, %450 ], [ %375, %447 ]
  %461 = phi i32 [ %457, %456 ], [ %376, %450 ], [ %376, %447 ]
  %462 = getelementptr inbounds %struct.Vertex, %struct.Vertex addrspace(1)* %0, i64 5, i32 0
  %463 = load i32, i32 addrspace(1)* %462, align 4, !tbaa.struct !11
  %464 = icmp eq i32 %460, %461
  br i1 %464, label %465, label %468

465:                                              ; preds = %459
  %466 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !15
  %467 = icmp eq i32 %466, %463
  br i1 %467, label %528, label %468

468:                                              ; preds = %465, %459
  %469 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !13
  %470 = icmp eq i32 %469, %461
  br i1 %470, label %471, label %474

471:                                              ; preds = %468
  %472 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !15
  %473 = icmp eq i32 %472, %463
  br i1 %473, label %528, label %474

474:                                              ; preds = %471, %468
  %475 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !13
  %476 = icmp eq i32 %475, %461
  br i1 %476, label %477, label %480

477:                                              ; preds = %474
  %478 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !15
  %479 = icmp eq i32 %478, %463
  br i1 %479, label %528, label %480

480:                                              ; preds = %477, %474
  %481 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !13
  %482 = icmp eq i32 %481, %461
  br i1 %482, label %483, label %486

483:                                              ; preds = %480
  %484 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !15
  %485 = icmp eq i32 %484, %463
  br i1 %485, label %528, label %486

486:                                              ; preds = %483, %480
  %487 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !13
  %488 = icmp eq i32 %487, %461
  br i1 %488, label %489, label %492

489:                                              ; preds = %486
  %490 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !15
  %491 = icmp eq i32 %490, %463
  br i1 %491, label %528, label %492

492:                                              ; preds = %489, %486
  %493 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !13
  %494 = icmp eq i32 %493, %461
  br i1 %494, label %495, label %498

495:                                              ; preds = %492
  %496 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !15
  %497 = icmp eq i32 %496, %463
  br i1 %497, label %528, label %498

498:                                              ; preds = %495, %492
  %499 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !13
  %500 = icmp eq i32 %499, %461
  br i1 %500, label %501, label %504

501:                                              ; preds = %498
  %502 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !15
  %503 = icmp eq i32 %502, %463
  br i1 %503, label %528, label %504

504:                                              ; preds = %501, %498
  %505 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !13
  %506 = icmp eq i32 %505, %461
  br i1 %506, label %507, label %510

507:                                              ; preds = %504
  %508 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !15
  %509 = icmp eq i32 %508, %463
  br i1 %509, label %528, label %510

510:                                              ; preds = %507, %504
  %511 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !13
  %512 = icmp eq i32 %511, %461
  br i1 %512, label %513, label %516

513:                                              ; preds = %510
  %514 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !15
  %515 = icmp eq i32 %514, %463
  br i1 %515, label %528, label %516

516:                                              ; preds = %513, %510
  %517 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !13
  %518 = icmp eq i32 %517, %461
  br i1 %518, label %519, label %522

519:                                              ; preds = %516
  %520 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !15
  %521 = icmp eq i32 %520, %463
  br i1 %521, label %528, label %522

522:                                              ; preds = %519, %516
  %523 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !13
  %524 = icmp eq i32 %523, %461
  br i1 %524, label %525, label %532

525:                                              ; preds = %522
  %526 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !15
  %527 = icmp eq i32 %526, %463
  br i1 %527, label %528, label %532

528:                                              ; preds = %525, %519, %513, %507, %501, %495, %489, %483, %477, %471, %465
  %529 = phi i64 [ 0, %465 ], [ 1, %471 ], [ 2, %477 ], [ 3, %483 ], [ 4, %489 ], [ 5, %495 ], [ 6, %501 ], [ 7, %507 ], [ 8, %513 ], [ 9, %519 ], [ 10, %525 ]
  %530 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %529
  %531 = load i32, i32 addrspace(1)* %530, align 4, !tbaa !12
  br label %532

532:                                              ; preds = %528, %525, %522
  %533 = phi i32 [ %531, %528 ], [ 1000000, %525 ], [ 1000000, %522 ]
  %534 = icmp slt i32 %533, 1000000
  br i1 %534, label %535, label %544

535:                                              ; preds = %532
  %536 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 5
  %537 = load i32, i32 addrspace(1)* %536, align 4, !tbaa !12
  %538 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !12
  %539 = add nsw i32 %538, %533
  %540 = icmp sgt i32 %537, %539
  br i1 %540, label %541, label %544

541:                                              ; preds = %535
  store i32 %539, i32 addrspace(1)* %536, align 4, !tbaa !12
  %542 = load i32, i32 addrspace(1)* %12, align 4, !tbaa.struct !11
  %543 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !13
  br label %544

544:                                              ; preds = %541, %535, %532
  %545 = phi i32 [ %543, %541 ], [ %460, %535 ], [ %460, %532 ]
  %546 = phi i32 [ %542, %541 ], [ %461, %535 ], [ %461, %532 ]
  %547 = getelementptr inbounds %struct.Vertex, %struct.Vertex addrspace(1)* %0, i64 6, i32 0
  %548 = load i32, i32 addrspace(1)* %547, align 4, !tbaa.struct !11
  %549 = icmp eq i32 %545, %546
  br i1 %549, label %550, label %553

550:                                              ; preds = %544
  %551 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !15
  %552 = icmp eq i32 %551, %548
  br i1 %552, label %613, label %553

553:                                              ; preds = %550, %544
  %554 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !13
  %555 = icmp eq i32 %554, %546
  br i1 %555, label %556, label %559

556:                                              ; preds = %553
  %557 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !15
  %558 = icmp eq i32 %557, %548
  br i1 %558, label %613, label %559

559:                                              ; preds = %556, %553
  %560 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !13
  %561 = icmp eq i32 %560, %546
  br i1 %561, label %562, label %565

562:                                              ; preds = %559
  %563 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !15
  %564 = icmp eq i32 %563, %548
  br i1 %564, label %613, label %565

565:                                              ; preds = %562, %559
  %566 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !13
  %567 = icmp eq i32 %566, %546
  br i1 %567, label %568, label %571

568:                                              ; preds = %565
  %569 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !15
  %570 = icmp eq i32 %569, %548
  br i1 %570, label %613, label %571

571:                                              ; preds = %568, %565
  %572 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !13
  %573 = icmp eq i32 %572, %546
  br i1 %573, label %574, label %577

574:                                              ; preds = %571
  %575 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !15
  %576 = icmp eq i32 %575, %548
  br i1 %576, label %613, label %577

577:                                              ; preds = %574, %571
  %578 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !13
  %579 = icmp eq i32 %578, %546
  br i1 %579, label %580, label %583

580:                                              ; preds = %577
  %581 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !15
  %582 = icmp eq i32 %581, %548
  br i1 %582, label %613, label %583

583:                                              ; preds = %580, %577
  %584 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !13
  %585 = icmp eq i32 %584, %546
  br i1 %585, label %586, label %589

586:                                              ; preds = %583
  %587 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !15
  %588 = icmp eq i32 %587, %548
  br i1 %588, label %613, label %589

589:                                              ; preds = %586, %583
  %590 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !13
  %591 = icmp eq i32 %590, %546
  br i1 %591, label %592, label %595

592:                                              ; preds = %589
  %593 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !15
  %594 = icmp eq i32 %593, %548
  br i1 %594, label %613, label %595

595:                                              ; preds = %592, %589
  %596 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !13
  %597 = icmp eq i32 %596, %546
  br i1 %597, label %598, label %601

598:                                              ; preds = %595
  %599 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !15
  %600 = icmp eq i32 %599, %548
  br i1 %600, label %613, label %601

601:                                              ; preds = %598, %595
  %602 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !13
  %603 = icmp eq i32 %602, %546
  br i1 %603, label %604, label %607

604:                                              ; preds = %601
  %605 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !15
  %606 = icmp eq i32 %605, %548
  br i1 %606, label %613, label %607

607:                                              ; preds = %604, %601
  %608 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !13
  %609 = icmp eq i32 %608, %546
  br i1 %609, label %610, label %617

610:                                              ; preds = %607
  %611 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !15
  %612 = icmp eq i32 %611, %548
  br i1 %612, label %613, label %617

613:                                              ; preds = %610, %604, %598, %592, %586, %580, %574, %568, %562, %556, %550
  %614 = phi i64 [ 0, %550 ], [ 1, %556 ], [ 2, %562 ], [ 3, %568 ], [ 4, %574 ], [ 5, %580 ], [ 6, %586 ], [ 7, %592 ], [ 8, %598 ], [ 9, %604 ], [ 10, %610 ]
  %615 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %614
  %616 = load i32, i32 addrspace(1)* %615, align 4, !tbaa !12
  br label %617

617:                                              ; preds = %613, %610, %607
  %618 = phi i32 [ %616, %613 ], [ 1000000, %610 ], [ 1000000, %607 ]
  %619 = icmp slt i32 %618, 1000000
  br i1 %619, label %620, label %629

620:                                              ; preds = %617
  %621 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 6
  %622 = load i32, i32 addrspace(1)* %621, align 4, !tbaa !12
  %623 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !12
  %624 = add nsw i32 %623, %618
  %625 = icmp sgt i32 %622, %624
  br i1 %625, label %626, label %629

626:                                              ; preds = %620
  store i32 %624, i32 addrspace(1)* %621, align 4, !tbaa !12
  %627 = load i32, i32 addrspace(1)* %12, align 4, !tbaa.struct !11
  %628 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !13
  br label %629

629:                                              ; preds = %626, %620, %617
  %630 = phi i32 [ %628, %626 ], [ %545, %620 ], [ %545, %617 ]
  %631 = phi i32 [ %627, %626 ], [ %546, %620 ], [ %546, %617 ]
  %632 = getelementptr inbounds %struct.Vertex, %struct.Vertex addrspace(1)* %0, i64 7, i32 0
  %633 = load i32, i32 addrspace(1)* %632, align 4, !tbaa.struct !11
  %634 = icmp eq i32 %630, %631
  br i1 %634, label %635, label %638

635:                                              ; preds = %629
  %636 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !15
  %637 = icmp eq i32 %636, %633
  br i1 %637, label %698, label %638

638:                                              ; preds = %635, %629
  %639 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !13
  %640 = icmp eq i32 %639, %631
  br i1 %640, label %641, label %644

641:                                              ; preds = %638
  %642 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !15
  %643 = icmp eq i32 %642, %633
  br i1 %643, label %698, label %644

644:                                              ; preds = %641, %638
  %645 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !13
  %646 = icmp eq i32 %645, %631
  br i1 %646, label %647, label %650

647:                                              ; preds = %644
  %648 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !15
  %649 = icmp eq i32 %648, %633
  br i1 %649, label %698, label %650

650:                                              ; preds = %647, %644
  %651 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !13
  %652 = icmp eq i32 %651, %631
  br i1 %652, label %653, label %656

653:                                              ; preds = %650
  %654 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !15
  %655 = icmp eq i32 %654, %633
  br i1 %655, label %698, label %656

656:                                              ; preds = %653, %650
  %657 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !13
  %658 = icmp eq i32 %657, %631
  br i1 %658, label %659, label %662

659:                                              ; preds = %656
  %660 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !15
  %661 = icmp eq i32 %660, %633
  br i1 %661, label %698, label %662

662:                                              ; preds = %659, %656
  %663 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !13
  %664 = icmp eq i32 %663, %631
  br i1 %664, label %665, label %668

665:                                              ; preds = %662
  %666 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !15
  %667 = icmp eq i32 %666, %633
  br i1 %667, label %698, label %668

668:                                              ; preds = %665, %662
  %669 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !13
  %670 = icmp eq i32 %669, %631
  br i1 %670, label %671, label %674

671:                                              ; preds = %668
  %672 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !15
  %673 = icmp eq i32 %672, %633
  br i1 %673, label %698, label %674

674:                                              ; preds = %671, %668
  %675 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !13
  %676 = icmp eq i32 %675, %631
  br i1 %676, label %677, label %680

677:                                              ; preds = %674
  %678 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !15
  %679 = icmp eq i32 %678, %633
  br i1 %679, label %698, label %680

680:                                              ; preds = %677, %674
  %681 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !13
  %682 = icmp eq i32 %681, %631
  br i1 %682, label %683, label %686

683:                                              ; preds = %680
  %684 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !15
  %685 = icmp eq i32 %684, %633
  br i1 %685, label %698, label %686

686:                                              ; preds = %683, %680
  %687 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !13
  %688 = icmp eq i32 %687, %631
  br i1 %688, label %689, label %692

689:                                              ; preds = %686
  %690 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !15
  %691 = icmp eq i32 %690, %633
  br i1 %691, label %698, label %692

692:                                              ; preds = %689, %686
  %693 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !13
  %694 = icmp eq i32 %693, %631
  br i1 %694, label %695, label %702

695:                                              ; preds = %692
  %696 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !15
  %697 = icmp eq i32 %696, %633
  br i1 %697, label %698, label %702

698:                                              ; preds = %695, %689, %683, %677, %671, %665, %659, %653, %647, %641, %635
  %699 = phi i64 [ 0, %635 ], [ 1, %641 ], [ 2, %647 ], [ 3, %653 ], [ 4, %659 ], [ 5, %665 ], [ 6, %671 ], [ 7, %677 ], [ 8, %683 ], [ 9, %689 ], [ 10, %695 ]
  %700 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %699
  %701 = load i32, i32 addrspace(1)* %700, align 4, !tbaa !12
  br label %702

702:                                              ; preds = %698, %695, %692
  %703 = phi i32 [ %701, %698 ], [ 1000000, %695 ], [ 1000000, %692 ]
  %704 = icmp slt i32 %703, 1000000
  br i1 %704, label %705, label %712

705:                                              ; preds = %702
  %706 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 7
  %707 = load i32, i32 addrspace(1)* %706, align 4, !tbaa !12
  %708 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !12
  %709 = add nsw i32 %708, %703
  %710 = icmp sgt i32 %707, %709
  br i1 %710, label %711, label %712

711:                                              ; preds = %705
  store i32 %709, i32 addrspace(1)* %706, align 4, !tbaa !12
  br label %712

712:                                              ; preds = %702, %705, %711, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !7, i64 4}
!6 = !{!"_ZTS6Vertex", !7, i64 0, !7, i64 4}
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{}
!11 = !{i64 0, i64 4, !12, i64 4, i64 4, !12}
!12 = !{!7, !7, i64 0}
!13 = !{!14, !7, i64 0}
!14 = !{!"_ZTS4Edge", !7, i64 0, !7, i64 4}
!15 = !{!14, !7, i64 4}
