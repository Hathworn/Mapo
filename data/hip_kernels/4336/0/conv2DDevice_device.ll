; ModuleID = '../data/hip_kernels/4336/0/main.cu'
source_filename = "../data/hip_kernels/4336/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ12conv2DDevicePKiPiE5local = internal unnamed_addr addrspace(3) global [1296 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12conv2DDevicePKiPi(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = getelementptr i8, i8 addrspace(4)* %3, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = mul i32 %4, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add i32 %9, %10
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %13 = getelementptr i8, i8 addrspace(4)* %3, i64 6
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 2, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %12, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %19 = add i32 %17, %18
  %20 = add nuw nsw i32 %10, 2
  %21 = icmp slt i32 %19, 16000
  %22 = icmp slt i32 %11, 16000
  %23 = select i1 %21, i1 %22, i1 false
  br i1 %23, label %24, label %258

24:                                               ; preds = %2
  %25 = mul nuw nsw i32 %18, 36
  %26 = add nuw nsw i32 %25, 72
  %27 = add nuw nsw i32 %26, %20
  %28 = mul nsw i32 %19, 16000
  %29 = add nsw i32 %28, %11
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !5
  %33 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %27
  store i32 %32, i32 addrspace(3)* %33, align 4, !tbaa !7
  %34 = icmp ugt i32 %10, 1
  br i1 %34, label %59, label %35

35:                                               ; preds = %24
  %36 = add nuw nsw i32 %10, 34
  %37 = add nsw i32 %11, 32
  %38 = icmp sgt i32 %11, 1
  %39 = icmp slt i32 %11, 15968
  %40 = add nuw nsw i32 %26, %10
  br i1 %38, label %41, label %47

41:                                               ; preds = %35
  %42 = add nsw i32 %11, -2
  %43 = add nsw i32 %28, %42
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %47

47:                                               ; preds = %35, %41
  %48 = phi i32 [ %46, %41 ], [ 0, %35 ]
  %49 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %40
  store i32 %48, i32 addrspace(3)* %49, align 4
  %50 = add nuw nsw i32 %26, %36
  br i1 %39, label %51, label %56

51:                                               ; preds = %47
  %52 = add nsw i32 %28, %37
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %56

56:                                               ; preds = %47, %51
  %57 = phi i32 [ %55, %51 ], [ 0, %47 ]
  %58 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %50
  store i32 %57, i32 addrspace(3)* %58, align 4
  br label %59

59:                                               ; preds = %56, %24
  %60 = icmp ugt i32 %18, 1
  br i1 %60, label %89, label %61

61:                                               ; preds = %59
  %62 = icmp sgt i32 %19, 1
  %63 = icmp slt i32 %19, 15968
  %64 = mul nuw nsw i32 %18, 36
  %65 = add nuw nsw i32 %64, %20
  br i1 %62, label %66, label %73

66:                                               ; preds = %61
  %67 = mul nuw nsw i32 %19, 16000
  %68 = add nsw i32 %67, -32000
  %69 = add nsw i32 %68, %11
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %70
  %72 = load i32, i32 addrspace(1)* %71, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %73

73:                                               ; preds = %61, %66
  %74 = phi i32 [ %72, %66 ], [ 0, %61 ]
  %75 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %65
  store i32 %74, i32 addrspace(3)* %75, align 4
  %76 = mul nuw nsw i32 %18, 36
  %77 = add nuw nsw i32 %76, 1224
  %78 = add nuw nsw i32 %77, %20
  br i1 %63, label %79, label %86

79:                                               ; preds = %73
  %80 = mul i32 %19, 16000
  %81 = add i32 %80, 512000
  %82 = add nsw i32 %81, %11
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %86

86:                                               ; preds = %73, %79
  %87 = phi i32 [ %85, %79 ], [ 0, %73 ]
  %88 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %78
  store i32 %87, i32 addrspace(3)* %88, align 4
  br label %89

89:                                               ; preds = %86, %59
  %90 = select i1 %34, i1 true, i1 %60
  br i1 %90, label %91, label %93

91:                                               ; preds = %89
  %92 = mul nuw nsw i32 %18, 36
  br label %152

93:                                               ; preds = %89
  %94 = add nuw nsw i32 %10, 34
  %95 = add nsw i32 %19, -2
  %96 = add nsw i32 %11, -2
  %97 = add nsw i32 %11, 32
  %98 = add nsw i32 %19, 32
  %99 = icmp sgt i32 %19, 1
  %100 = icmp sgt i32 %11, 1
  %101 = icmp slt i32 %19, 15968
  %102 = icmp slt i32 %11, 15968
  %103 = select i1 %101, i1 %102, i1 false
  %104 = icmp slt i32 %11, 15968
  %105 = select i1 %99, i1 %104, i1 false
  %106 = icmp sgt i32 %11, 1
  %107 = select i1 %101, i1 %106, i1 false
  %108 = select i1 %99, i1 %100, i1 false
  %109 = mul nuw nsw i32 %18, 36
  %110 = add nuw nsw i32 %109, %10
  br i1 %108, label %111, label %117

111:                                              ; preds = %93
  %112 = mul nuw nsw i32 %95, 16000
  %113 = add nuw nsw i32 %112, %96
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %114
  %116 = load i32, i32 addrspace(1)* %115, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %117

117:                                              ; preds = %93, %111
  %118 = phi i32 [ %116, %111 ], [ 0, %93 ]
  %119 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %110
  store i32 %118, i32 addrspace(3)* %119, align 4
  %120 = add nuw nsw i32 %109, %94
  br i1 %105, label %121, label %127

121:                                              ; preds = %117
  %122 = mul nuw nsw i32 %95, 16000
  %123 = add nsw i32 %122, %97
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %124
  %126 = load i32, i32 addrspace(1)* %125, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %127

127:                                              ; preds = %117, %121
  %128 = phi i32 [ %126, %121 ], [ 0, %117 ]
  %129 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %120
  store i32 %128, i32 addrspace(3)* %129, align 4
  %130 = mul nuw nsw i32 %18, 36
  %131 = add nuw nsw i32 %130, 1224
  %132 = add nuw nsw i32 %131, %10
  br i1 %107, label %133, label %139

133:                                              ; preds = %127
  %134 = mul nsw i32 %98, 16000
  %135 = add nsw i32 %134, %96
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %136
  %138 = load i32, i32 addrspace(1)* %137, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %139

139:                                              ; preds = %127, %133
  %140 = phi i32 [ %138, %133 ], [ 0, %127 ]
  %141 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %132
  store i32 %140, i32 addrspace(3)* %141, align 4
  %142 = add nuw nsw i32 %131, %94
  br i1 %103, label %143, label %149

143:                                              ; preds = %139
  %144 = mul nsw i32 %98, 16000
  %145 = add nsw i32 %144, %97
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %146
  %148 = load i32, i32 addrspace(1)* %147, align 4, !tbaa !7, !amdgpu.noclobber !5
  br label %149

149:                                              ; preds = %139, %143
  %150 = phi i32 [ %148, %143 ], [ 0, %139 ]
  %151 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %142
  store i32 %150, i32 addrspace(3)* %151, align 4
  br label %152

152:                                              ; preds = %91, %149
  %153 = phi i32 [ %92, %91 ], [ %109, %149 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %154 = add nuw nsw i32 %153, %20
  %155 = add nuw nsw i32 %153, %10
  %156 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %155
  %157 = load i32, i32 addrspace(3)* %156, align 4, !tbaa !7
  %158 = add nsw i32 %154, -1
  %159 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %158
  %160 = load i32, i32 addrspace(3)* %159, align 4, !tbaa !7
  %161 = add nsw i32 %160, %157
  %162 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %154
  %163 = load i32, i32 addrspace(3)* %162, align 4, !tbaa !7
  %164 = add nsw i32 %163, %161
  %165 = add nuw nsw i32 %154, 1
  %166 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %165
  %167 = load i32, i32 addrspace(3)* %166, align 4, !tbaa !7
  %168 = add nsw i32 %167, %164
  %169 = add nuw nsw i32 %154, 2
  %170 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %169
  %171 = load i32, i32 addrspace(3)* %170, align 4, !tbaa !7
  %172 = add nsw i32 %171, %168
  %173 = mul nuw nsw i32 %18, 36
  %174 = add nuw nsw i32 %173, 36
  %175 = add nuw nsw i32 %174, %20
  %176 = add nuw nsw i32 %174, %10
  %177 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %176
  %178 = load i32, i32 addrspace(3)* %177, align 4, !tbaa !7
  %179 = add nsw i32 %178, %172
  %180 = add nsw i32 %175, -1
  %181 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %180
  %182 = load i32, i32 addrspace(3)* %181, align 4, !tbaa !7
  %183 = add nsw i32 %182, %179
  %184 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %175
  %185 = load i32, i32 addrspace(3)* %184, align 4, !tbaa !7
  %186 = add nsw i32 %185, %183
  %187 = add nuw nsw i32 %175, 1
  %188 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %187
  %189 = load i32, i32 addrspace(3)* %188, align 4, !tbaa !7
  %190 = add nsw i32 %189, %186
  %191 = add nuw nsw i32 %175, 2
  %192 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %191
  %193 = load i32, i32 addrspace(3)* %192, align 4, !tbaa !7
  %194 = add nsw i32 %193, %190
  %195 = add nuw nsw i32 %26, %10
  %196 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %195
  %197 = load i32, i32 addrspace(3)* %196, align 4, !tbaa !7
  %198 = add nsw i32 %197, %194
  %199 = add nsw i32 %27, -1
  %200 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %199
  %201 = load i32, i32 addrspace(3)* %200, align 4, !tbaa !7
  %202 = add nsw i32 %201, %198
  %203 = load i32, i32 addrspace(3)* %33, align 4, !tbaa !7
  %204 = add nsw i32 %203, %202
  %205 = add nuw nsw i32 %27, 1
  %206 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %205
  %207 = load i32, i32 addrspace(3)* %206, align 4, !tbaa !7
  %208 = add nsw i32 %207, %204
  %209 = add nuw nsw i32 %27, 2
  %210 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %209
  %211 = load i32, i32 addrspace(3)* %210, align 4, !tbaa !7
  %212 = add nsw i32 %211, %208
  %213 = mul nuw nsw i32 %18, 36
  %214 = add nuw nsw i32 %213, 108
  %215 = add nuw nsw i32 %214, %20
  %216 = add nuw nsw i32 %214, %10
  %217 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %216
  %218 = load i32, i32 addrspace(3)* %217, align 4, !tbaa !7
  %219 = add nsw i32 %218, %212
  %220 = add nsw i32 %215, -1
  %221 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %220
  %222 = load i32, i32 addrspace(3)* %221, align 4, !tbaa !7
  %223 = add nsw i32 %222, %219
  %224 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %215
  %225 = load i32, i32 addrspace(3)* %224, align 4, !tbaa !7
  %226 = add nsw i32 %225, %223
  %227 = add nuw nsw i32 %215, 1
  %228 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %227
  %229 = load i32, i32 addrspace(3)* %228, align 4, !tbaa !7
  %230 = add nsw i32 %229, %226
  %231 = add nuw nsw i32 %215, 2
  %232 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %231
  %233 = load i32, i32 addrspace(3)* %232, align 4, !tbaa !7
  %234 = add nsw i32 %233, %230
  %235 = mul nuw nsw i32 %18, 36
  %236 = add nuw nsw i32 %235, 144
  %237 = add nuw nsw i32 %236, %20
  %238 = add nuw nsw i32 %236, %10
  %239 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %238
  %240 = load i32, i32 addrspace(3)* %239, align 4, !tbaa !7
  %241 = add nsw i32 %240, %234
  %242 = add nsw i32 %237, -1
  %243 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %242
  %244 = load i32, i32 addrspace(3)* %243, align 4, !tbaa !7
  %245 = add nsw i32 %244, %241
  %246 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %237
  %247 = load i32, i32 addrspace(3)* %246, align 4, !tbaa !7
  %248 = add nsw i32 %247, %245
  %249 = add nuw nsw i32 %237, 1
  %250 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %249
  %251 = load i32, i32 addrspace(3)* %250, align 4, !tbaa !7
  %252 = add nsw i32 %251, %248
  %253 = add nuw nsw i32 %237, 2
  %254 = getelementptr inbounds [1296 x i32], [1296 x i32] addrspace(3)* @_ZZ12conv2DDevicePKiPiE5local, i32 0, i32 %253
  %255 = load i32, i32 addrspace(3)* %254, align 4, !tbaa !7
  %256 = add nsw i32 %255, %252
  %257 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %30
  store i32 %256, i32 addrspace(1)* %257, align 4, !tbaa !7
  br label %258

258:                                              ; preds = %152, %2
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
